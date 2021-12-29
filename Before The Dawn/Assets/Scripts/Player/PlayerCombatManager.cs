using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    public class PlayerCombatManager : MonoBehaviour
    {
        PlayerAnimatorManager playerAnimatorManager;
        PlayerManager playerManager;
        PlayerEquipmentManager playerEquipmentManager;
        InputHandler inputHandler;
        PlayerWeaponSlotManager playerWeaponSlotManager;
        PlayerStatsManager playerStatsManager;
        PlayerInventoryManager playerInventory;
        CameraHandler cameraHandler;
        PlayerFXManager playerFXManager;

        [Header("Attack Animations")]
        string OH_Light_Attack_01 = "OH_Light_Attack_01";
        string OH_Light_Attack_02 = "OH_Light_Attack_02";
        string OH_Heavy_Attack_01 = "OH_Heavy_Attack_01";
        string OH_Heavy_Attack_02 = "OH_Heavy_Attack_02";
        string OH_Running_Attack_01 = "OH_Running_Attack_01";
        string OH_Jumping_Attack_01 = "OH_Jumping_Attack_01";

        string TH_Light_Attack_01 = "TH_Light_Attack_01";
        string TH_Light_Attack_02 = "TH_Light_Attack_02";
        string TH_Heavy_Attack_01 = "TH_Heavy_Attack_01";
        string TH_Heavy_Attack_02 = "TH_Heavy_Attack_02";
        string TH_Running_Attack_01 = "TH_Running_Attack_01";
        string TH_Jumping_Attack_01 = "TH_Jumping_Attack_01";

        string weapon_Art = "Weapon_Art";

        public string lastAttack;

        LayerMask backStabLayer = 1 << 14;
        LayerMask riposteLayer = 1 << 16;

        public float lightStaminaNeededToAttack = 25f;
        public float heavyStaminaNeededToAttack = 50f;

        private void Awake()
        {
            playerAnimatorManager = GetComponent<PlayerAnimatorManager>();
            playerWeaponSlotManager = GetComponent<PlayerWeaponSlotManager>();
            inputHandler = GetComponent<InputHandler>();
            playerStatsManager = GetComponent<PlayerStatsManager>();
            playerManager = GetComponent<PlayerManager>();
            playerInventory = GetComponent<PlayerInventoryManager>();
            playerEquipmentManager = GetComponent<PlayerEquipmentManager>();
            cameraHandler = FindObjectOfType<CameraHandler>();
            playerFXManager = GetComponent<PlayerFXManager>();
        }

        public void HandleWeaponCombo(WeaponItem weapon)
        {
            if (inputHandler.comboFlag)
            {
                playerAnimatorManager.animator.SetBool("canDoCombo", false);

                if (lastAttack == OH_Light_Attack_01)
                {
                    playerAnimatorManager.PlayTargetAnimation(OH_Light_Attack_02, true);
                }
                
                else if (lastAttack == OH_Light_Attack_02)
                {
                    playerAnimatorManager.PlayTargetAnimation(OH_Light_Attack_01, true);
                }

                else if (lastAttack == OH_Heavy_Attack_01)
                {
                    playerAnimatorManager.PlayTargetAnimation(OH_Heavy_Attack_02, true);
                }
                else if (lastAttack == TH_Light_Attack_01)
                {
                    playerAnimatorManager.PlayTargetAnimation(TH_Light_Attack_02, true);
                }
                else if (lastAttack == TH_Heavy_Attack_01)
                {
                    playerAnimatorManager.PlayTargetAnimation(TH_Heavy_Attack_02, true);
                }
            }
        }

        private void HandleLightAttack(WeaponItem weapon)
        {
            if (playerStatsManager.currentStamina < lightStaminaNeededToAttack)
                return;

            playerWeaponSlotManager.attackingWeapon = weapon;

            if (inputHandler.twoHandFlag)
            {
                playerAnimatorManager.PlayTargetAnimation(TH_Light_Attack_01, true);
                lastAttack = TH_Light_Attack_01;
            }
            else
            {
                playerAnimatorManager.PlayTargetAnimation(OH_Light_Attack_01, true);
                lastAttack = OH_Light_Attack_01;
                //EndAttack();
            }
        }

        private void HandleJumpingAttack(WeaponItem weapon)
        {
            if (playerStatsManager.currentStamina < lightStaminaNeededToAttack)
                return;

            playerWeaponSlotManager.attackingWeapon = weapon;

            if (inputHandler.twoHandFlag)
            {
                playerAnimatorManager.PlayTargetAnimation(TH_Jumping_Attack_01, true);
                lastAttack = TH_Jumping_Attack_01;
            }
            else
            {
                playerAnimatorManager.PlayTargetAnimation(OH_Jumping_Attack_01, true);
                lastAttack = OH_Jumping_Attack_01;
                //EndAttack();
            }
        }

        private void HandleHeavyAttack(WeaponItem weapon)
        {
            if (playerStatsManager.currentStamina < heavyStaminaNeededToAttack)
                return;
            playerAnimatorManager.EraseHandIKForWeapon();

            playerWeaponSlotManager.attackingWeapon = weapon;

            if (inputHandler.twoHandFlag)
            {
                playerAnimatorManager.PlayTargetAnimation(TH_Heavy_Attack_01, true);
                lastAttack = TH_Heavy_Attack_01;
            }
            else
            {
                playerAnimatorManager.PlayTargetAnimation(OH_Heavy_Attack_01, true);
                lastAttack = OH_Heavy_Attack_01;
            }
        }

        private void HandleRunningAttack(WeaponItem weapon)
        {
            if (playerStatsManager.currentStamina < lightStaminaNeededToAttack)
                return;

            playerWeaponSlotManager.attackingWeapon = weapon;

            if (inputHandler.twoHandFlag)
            {
                playerAnimatorManager.PlayTargetAnimation(TH_Running_Attack_01, true);
                lastAttack = TH_Running_Attack_01;
            }
            else
            {
                playerAnimatorManager.PlayTargetAnimation(OH_Running_Attack_01, true);
                lastAttack = OH_Running_Attack_01;
                //EndAttack();
            }
        }

        //public void EndAttack()
        //{
        //    playerAnimatorManager.animator.SetBool("isAttacking", false);
        //}

        public void HandleRBAction()
        {
            if (playerStatsManager.currentStamina <= 0)
                return;

            playerAnimatorManager.EraseHandIKForWeapon();

            if (playerInventory.rightWeapon.weaponType == WeaponType.StraightSword
                || playerInventory.rightWeapon.weaponType == WeaponType.GreatSword
                || playerInventory.rightWeapon.weaponType == WeaponType.Unarmed)
            {
                PerformRBMeleeAction();
            }
            else if (playerInventory.rightWeapon.weaponType == WeaponType.SpellCaster 
                || playerInventory.rightWeapon.weaponType == WeaponType.FaithCaster 
                || playerInventory.rightWeapon.weaponType == WeaponType.PyromancyCaster)
            {
                PerformRBMagicAction(playerInventory.rightWeapon);
            }
        }

        public void HandleRTAction()
        {
            if (playerStatsManager.currentStamina <= 0)
                return;

            playerAnimatorManager.EraseHandIKForWeapon();

            if (playerInventory.rightWeapon.weaponType == WeaponType.StraightSword
                || playerInventory.rightWeapon.weaponType == WeaponType.GreatSword
                || playerInventory.rightWeapon.weaponType == WeaponType.Unarmed)
            {
                PerformRTMeleeAction();
            }
            else if (playerInventory.rightWeapon.weaponType == WeaponType.SpellCaster
                || playerInventory.rightWeapon.weaponType == WeaponType.FaithCaster
                || playerInventory.rightWeapon.weaponType == WeaponType.PyromancyCaster)
            {
                PerformRBMagicAction(playerInventory.rightWeapon);
            }
        }

        public void HandleLBAction()
        {
            PerformLBBlockAction();
        }

        public void HandleLTAction()
        {
            if (playerInventory.leftWeapon.weaponType == WeaponType.Shield
                || playerInventory.rightWeapon.weaponType == WeaponType.Unarmed)
            {
                PerformLTWeaponArt(inputHandler);
            }
            else if (playerInventory.leftWeapon.weaponType == WeaponType.StraightSword)
            {
                //light attack
            }
        }

        private void PerformRBMeleeAction()
        {
            playerAnimatorManager.animator.SetBool("isUsingRightHand", true);
            //If player can perform a running attack, running attack is performed if not continue
            if (playerManager.isSprinting)
            {
                HandleRunningAttack(playerInventory.rightWeapon);
                return;
            }
            //If player can do combo player performs combo
            if (playerManager.canDoCombo)
            {
                inputHandler.comboFlag = true;
                HandleWeaponCombo(playerInventory.rightWeapon);
                inputHandler.comboFlag = false;
            }
            //If player can not combo player performs regular attack
            else
            {
                if (playerManager.isInteracting)
                    return;
                if (playerManager.canDoCombo)
                    return;

                playerAnimatorManager.animator.SetBool("isUsingRightHand", true);
                HandleLightAttack(playerInventory.rightWeapon);
            }

            playerFXManager.PlayWeaponFX(false);
        }

        private void PerformRTMeleeAction()
        {
            playerAnimatorManager.animator.SetBool("isUsingRightHand", true);

            if (playerManager.isSprinting)
            {
                HandleJumpingAttack(playerInventory.rightWeapon);
                return;
            }
            //If player can do combo player performs combo
            if (playerManager.canDoCombo)
            {
                inputHandler.comboFlag = true;
                HandleWeaponCombo(playerInventory.rightWeapon);
                inputHandler.comboFlag = false;
            }
            //If player can not combo player performs regular attack
            else
            {
                if (playerManager.isInteracting)
                    return;
                if (playerManager.canDoCombo)
                    return;

                playerAnimatorManager.animator.SetBool("isUsingRightHand", true);
                HandleHeavyAttack(playerInventory.rightWeapon);
            }

            playerFXManager.PlayWeaponFX(false);
        }

        private void PerformRBMagicAction(WeaponItem weapon)
        {
            if (playerManager.isInteracting)
                return;

            if (weapon.weaponType == WeaponType.FaithCaster)
            {
                if (playerInventory.currentSpell != null && playerInventory.currentSpell.isFaithSpell)
                {
                    if (playerStatsManager.currentFocus >= playerInventory.currentSpell.focusCost)
                    {
                        playerInventory.currentSpell.AttemptToCastSpell(playerAnimatorManager, playerStatsManager, playerWeaponSlotManager);
                    }
                    else
                    {
                        playerAnimatorManager.PlayTargetAnimation("Shrug", true);
                    }
                }
            }
            else if (weapon.weaponType == WeaponType.PyromancyCaster)
            {
                if (playerInventory.currentSpell != null && playerInventory.currentSpell.isPyroSpell)
                {
                    if (playerStatsManager.currentFocus >= playerInventory.currentSpell.focusCost)
                    {
                        playerInventory.currentSpell.AttemptToCastSpell(playerAnimatorManager, playerStatsManager, playerWeaponSlotManager);
                    }
                    else
                    {
                        playerAnimatorManager.PlayTargetAnimation("Shrug", true);
                    }
                }
            }
        }

        private void PerformLBBlockAction()
        {
            if (playerManager.isInteracting)
                return;

            if (playerManager.isBlocking)
                return;

            playerAnimatorManager.PlayTargetAnimation("Block", false, true);
            playerEquipmentManager.OpenBlockingCollider();
            playerManager.isBlocking = true;
        }

        private void PerformLTWeaponArt(bool isLeftWeapon)
        {
            if (playerManager.isInteracting)
                return;

            if (isLeftWeapon)
            {
                playerAnimatorManager.PlayTargetAnimation(weapon_Art, true);
            }
            else
            {

            }
        }

        private void SuccessfullyCastSpell()
        {
            playerInventory.currentSpell.SuccessfullyCastSpell(playerAnimatorManager, playerStatsManager, cameraHandler, playerWeaponSlotManager);
            playerAnimatorManager.animator.SetBool("isFiringSpell", true);
        }

        public void AttemptBackStabOrRiposte()
        {
            RaycastHit hit;

            if (Physics.Raycast(inputHandler.criticalAttackRayCastStartPoint.position,
                transform.TransformDirection(Vector3.forward), out hit, 0.5f, backStabLayer))
            {
                CharacterManager enemyCharacterManager = hit.transform.gameObject.GetComponentInParent<CharacterManager>();
                DamageCollider rightWeapon = playerWeaponSlotManager.rightHandDamageCollider;

                if (enemyCharacterManager != null)
                {
                    //CHECK FOR TEAM I.D (So you cant back stab friends or yourself?)
                    playerManager.transform.position = enemyCharacterManager.backStabCollider.criticalDamagerStandPosition.position;

                    Vector3 rotationDirection = playerManager.transform.root.eulerAngles;
                    rotationDirection = hit.transform.position - playerManager.transform.position;
                    rotationDirection.y = 0;
                    rotationDirection.Normalize();
                    Quaternion tr = Quaternion.LookRotation(rotationDirection);
                    Quaternion targetRotation = Quaternion.Slerp(playerManager.transform.rotation, tr, 500 * Time.deltaTime);
                    playerManager.transform.rotation = targetRotation;

                    int criticalDamage = playerInventory.rightWeapon.CriticalDamageMultiplier * rightWeapon.physicalDamage;
                    enemyCharacterManager.pendingCriticalDamage = criticalDamage;

                    playerAnimatorManager.PlayTargetAnimation("Back Stab", true);
                    enemyCharacterManager.GetComponentInChildren<AnimatorManager>().PlayTargetAnimation("Back Stabbed", true);
                    //do damage
                }
            }
            else if (Physics.Raycast(inputHandler.criticalAttackRayCastStartPoint.position, transform.TransformDirection(Vector3.forward), out hit, 0.7f, riposteLayer))
            {
                //Check for team ID
                CharacterManager enemyCharacterManager = hit.transform.gameObject.GetComponentInParent<CharacterManager>();
                DamageCollider rightWeapon = playerWeaponSlotManager.rightHandDamageCollider;

                if (enemyCharacterManager != null && enemyCharacterManager.canBeRiposted)
                {
                    playerManager.transform.position = enemyCharacterManager.riposteCollider.criticalDamagerStandPosition.position;

                    Vector3 rotationDirection = playerManager.transform.root.eulerAngles;
                    rotationDirection = hit.transform.position - playerManager.transform.position;
                    rotationDirection.y = 0;
                    rotationDirection.Normalize();
                    Quaternion tr = Quaternion.LookRotation(rotationDirection);
                    Quaternion targetRotation = Quaternion.Slerp(playerManager.transform.rotation, tr, 500 * Time.deltaTime);
                    playerManager.transform.rotation = targetRotation;

                    int criticalDamage = playerInventory.rightWeapon.CriticalDamageMultiplier * rightWeapon.physicalDamage;
                    enemyCharacterManager.pendingCriticalDamage = criticalDamage;

                    playerAnimatorManager.PlayTargetAnimation("Riposte", true);
                    enemyCharacterManager.GetComponentInChildren<AnimatorManager>().PlayTargetAnimation("Riposted", true);
                }
            } 
        }
    }
}
