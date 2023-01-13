using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    public class CharacterWeaponSlotManager : MonoBehaviour
    {
        protected CharacterManager characterManager;
        protected CharacterInventoryManager characterInventoryManager;
        protected CharacterStatsManager characterStatsManager;
        protected CharacterFXManager characterFXManager;
        protected AnimatorManager animatorManager;

        [Header("Consumable Item")]
        public ConsumableItem quickSlot;

        [Header("Unarmed Weapon")]
        public WeaponItem unarmedWeapon;

        [Header("Weapon Slots")]
        public WeaponHolderSlot leftHandSlot;
        public WeaponHolderSlot rightHandSlot;
        public WeaponHolderSlot backSlot;

        [Header("Damage Colliders")]
        public DamageCollider leftHandDamageCollider;
        public DamageCollider rightHandDamageCollider;

        [Header("Attacking Weapon")]
        public WeaponItem attackingWeapon;

        [Header("Hand IK Targets")]
        public RightHandIKTarget rightHandIKTarget;
        public LeftHandIKTarget leftHandIKTarget;

        protected virtual void Awake()
        {
            characterManager = GetComponent<CharacterManager>();
            animatorManager = GetComponent<AnimatorManager>();
            characterInventoryManager = GetComponent<CharacterInventoryManager>();
            characterStatsManager = GetComponent<CharacterStatsManager>();
            characterFXManager = GetComponent<CharacterFXManager>();
            LoadWeaponHolderSlots();
        }

        protected virtual void LoadWeaponHolderSlots()
        {
            WeaponHolderSlot[] weaponHolderSlots = GetComponentsInChildren<WeaponHolderSlot>();
            foreach (WeaponHolderSlot weaponSlot in weaponHolderSlots)
            {
                if (weaponSlot.isLeftHandSlot)
                {
                    leftHandSlot = weaponSlot;
                }
                else if (weaponSlot.isRightHandSlot)
                {
                    rightHandSlot = weaponSlot;
                }
                else if (weaponSlot.isBackSlot)
                {
                    backSlot = weaponSlot;
                }
            }
        }

        public virtual void LoadBothWeaponsOnSlots()
        {
            LoadWeaponOnSlot(characterInventoryManager.rightWeapon, false);
            LoadWeaponOnSlot(characterInventoryManager.leftWeapon, true);
        }

        public virtual void LoadWeaponOnSlot(WeaponItem weaponItem, bool isLeft)
        {
            if (weaponItem != null)
            {
                if (isLeft)
                {
                    leftHandSlot.currentWeapon = weaponItem;
                    leftHandSlot.LoadWeaponModel(weaponItem);
                    LoadLeftWeaponDamageCollider();
                    animatorManager.PlayTargetAnimation(weaponItem.offHandIdleAnimation, false, true);
                }
                else
                {
                    if (characterManager.isTwoHanding)
                    {
                        backSlot.LoadWeaponModel(leftHandSlot.currentWeapon);
                        leftHandSlot.UnloadWeaponAndDestroy();
                        animatorManager.PlayTargetAnimation("Left Arm Empty", false, true);
                    }
                    else
                    {
                        backSlot.UnloadWeaponAndDestroy();
                    }

                    rightHandSlot.currentWeapon = weaponItem;
                    rightHandSlot.LoadWeaponModel(weaponItem);
                    LoadRightWeaponDamageCollider();
                    animatorManager.animator.runtimeAnimatorController = weaponItem.weaponController;
                }
            }
            else
            {
                weaponItem = unarmedWeapon;

                if (isLeft)
                {
                    characterInventoryManager.leftWeapon = unarmedWeapon;
                    leftHandSlot.currentWeapon = unarmedWeapon;
                    leftHandSlot.LoadWeaponModel(unarmedWeapon);
                    LoadLeftWeaponDamageCollider();
                    animatorManager.PlayTargetAnimation(weaponItem.offHandIdleAnimation, false, true);
                }
                else
                {
                    characterInventoryManager.rightWeapon = unarmedWeapon;
                    rightHandSlot.currentWeapon = unarmedWeapon;
                    rightHandSlot.LoadWeaponModel(unarmedWeapon);
                    LoadRightWeaponDamageCollider();
                    animatorManager.animator.runtimeAnimatorController = weaponItem.weaponController;
                }
            }
        }

        protected virtual void LoadLeftWeaponDamageCollider()
        {
            leftHandDamageCollider = leftHandSlot.currentWeaponModel.GetComponentInChildren<DamageCollider>();

            leftHandDamageCollider.physicalDamage = characterInventoryManager.leftWeapon.physicalDamage;
            leftHandDamageCollider.fireDamage = characterInventoryManager.leftWeapon.fireDamage;

            leftHandDamageCollider.teamIDNumber = characterStatsManager.teamIDNumber;

            leftHandDamageCollider.poiseBreak = characterInventoryManager.leftWeapon.poiseBreak;
            characterFXManager.leftWeaponFX = leftHandSlot.currentWeaponModel.GetComponentInChildren<WeaponFX>();
            leftHandDamageCollider.characterManager = GetComponent<CharacterManager>();
        }

        protected virtual void LoadRightWeaponDamageCollider()
        {
            rightHandDamageCollider = rightHandSlot.currentWeaponModel.GetComponentInChildren<DamageCollider>();
            attackingWeapon = rightHandSlot.currentWeapon;

            rightHandDamageCollider.physicalDamage = characterInventoryManager.rightWeapon.physicalDamage;
            rightHandDamageCollider.fireDamage = characterInventoryManager.rightWeapon.fireDamage;

            rightHandDamageCollider.teamIDNumber = characterStatsManager.teamIDNumber;

            rightHandDamageCollider.poiseBreak = characterInventoryManager.rightWeapon.poiseBreak;
            characterFXManager.rightWeaponFX = rightHandSlot.currentWeaponModel.GetComponentInChildren<WeaponFX>();
            rightHandDamageCollider.characterManager = GetComponent<CharacterManager>();
        }

        public virtual void LoadTwoHandIKTargets(bool isTwoHanding)
        {
            leftHandIKTarget = rightHandSlot.currentWeaponModel.GetComponentInChildren<LeftHandIKTarget>();
            rightHandIKTarget = rightHandSlot.currentWeaponModel.GetComponentInChildren<RightHandIKTarget>();

            animatorManager.SetHandIKForWeapon(rightHandIKTarget, leftHandIKTarget, isTwoHanding);
        }

        public virtual void OpenDamageCollider()
        {
            if (characterManager.isUsingRightHand)
            {
                rightHandDamageCollider.EnableDamageCollider();
            }
            else if (characterManager.isUsingLeftHand)
            {
                leftHandDamageCollider.EnableDamageCollider();
            }
        }

        public virtual void CloseDamageCollider()
        {
            if (rightHandDamageCollider != null)
            {
                rightHandDamageCollider.DisableDamageCollider();
            }

            if (leftHandDamageCollider != null)
            {
                leftHandDamageCollider.DisableDamageCollider();
            }
        }
        public virtual void GrantWeaponAttackingPoiseBonus()
        {
            characterStatsManager.totalPoiseDefense += attackingWeapon.offensivePoiseBonus;
        }

        public virtual void ResetWeaponAttackingPoiseBonus()
        {
            characterStatsManager.totalPoiseDefense = characterStatsManager.armorPoiseBonus;
        }

        public virtual void LoadConsumableItemOnQuickSlot(ConsumableItem consumableItem)
        {
            if (consumableItem != null)
            {
                quickSlot.currentItem = consumableItem;
            }
        }
    }
}