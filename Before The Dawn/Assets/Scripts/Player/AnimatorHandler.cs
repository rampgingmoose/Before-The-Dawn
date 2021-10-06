using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    public class AnimatorHandler : AnimatorManager
    {
        PlayerManager playerManager;
        PlayerStats playerStats;
        InputHandler inputHandler;
        PlayerLocomotion playerLocomotion;
        BlockCharacterCollision blockCharacterCollision;
        int vertical;
        int horizontal;
        public GameObject[] effect;
        public Transform[] effectTransform;

        public void Initialize()
        {
            playerManager = GetComponentInParent<PlayerManager>();
            playerStats = GetComponentInParent<PlayerStats>();
            anim = GetComponent<Animator>();
            inputHandler = GetComponentInParent<InputHandler>();
            playerLocomotion = GetComponentInParent<PlayerLocomotion>();
            blockCharacterCollision = GetComponent<BlockCharacterCollision>();
            vertical = Animator.StringToHash("Vertical");
            horizontal = Animator.StringToHash("Horizontal");
        }

        public void UpdateAnimatorValues(float verticalMovement, float horizontalMovement, bool isSprinting)
        {
            #region Vertical
            float v = 0;

            if (verticalMovement > 0 && verticalMovement < 0.55f)
            {
                v = 0.5f;
            }
            else if (verticalMovement > 0.55f)
            {
                v = 1;
            }
            else if(verticalMovement < 0 && verticalMovement > -0.55f)
            {
                v = -0.5f;
            }
            else if(verticalMovement < -0.55f)
            {
                v = -1;
            }
            else
            {
                v = 0;
            }
            #endregion

            #region Horizontal
            float h = 0;

            if(horizontalMovement > 0 && horizontalMovement < 0.55f)
            {
                h = 0.5f;
            }
            else if(horizontalMovement > 0.55f)
            {
                h = 1;
            }
            else if(horizontalMovement < 0 && horizontalMovement > -0.55f)
            {
                h = -0.5f;
            }
            else if(horizontalMovement < -0.55f)
            {
                h = -1;
            }
            else
            {
                h = 0;
            }
            #endregion

            if (isSprinting)
            {
                v = 2;
                h = horizontalMovement;
            }

            anim.SetFloat(vertical, v, 0.1f, Time.deltaTime);
            anim.SetFloat(horizontal, h, 0.1f, Time.deltaTime);
        }

        public void CanRotate()
        {
            anim.SetBool("canRotate", true);
        }

        public void StopRotation()
        {
            anim.SetBool("canRotate", false);
        }

        public void EnableCombo()
        {
            anim.SetBool("canDoCombo", true);
        }

        public void DisableCombo()
        {
            anim.SetBool("canDoCombo", false);
        }

        public void EnableIsInvulnerable()
        {
            anim.SetBool("isInvulnerable", true);
        }

        public void DisableIsInvulnerable()
        {
            anim.SetBool("isInvulnerable", false);
        }

        public void IsParrying()
        {
            playerManager.isParrying = true;
        }

        public void DisableIsParrying()
        {
            playerManager.isParrying = false;
        }

        public void EnableCanBeRiposted()
        {
            playerManager.canBeRiposted = true;
        }

        public void DisableCanBeRiposted()
        {
            playerManager.canBeRiposted = false;
        }

        public void isAttacking()
        {
            playerManager.isAttacking = true;
        }

        public void DisableIsAttacking()
        {
            playerManager.isAttacking = false;
        }

        public override void TakeCriticalDamageAnimationEvent()
        {
            playerStats.TakeDamageNoAnimation(playerManager.pendingCriticalDamage);
            playerManager.pendingCriticalDamage = 0;
        }

        public void DisableCollision()
        {
            playerLocomotion.characterCollider.enabled = false;
            playerLocomotion.characterCollisionBlocker.enabled = false;
        }

        public void EnableCollision()
        {
            playerLocomotion.characterCollider.enabled = true;
            playerLocomotion.characterCollisionBlocker.enabled = true;
        }

        public void EnableSpell(int number)
        {
            Instantiate(effect[number], effectTransform[number].position, effectTransform[number].rotation);
        }

        private void OnAnimatorMove()
        {
            if (playerManager.isInteracting == false)
            {
                return;
            }
            
            float delta = Time.deltaTime;
            playerLocomotion.rigidBody.drag = 0;
            Vector3 deltaPosition = anim.deltaPosition;
            deltaPosition.y = 0;
            Vector3 velocity = deltaPosition / delta;
            playerLocomotion.rigidBody.velocity = velocity;
        }
    }
}
