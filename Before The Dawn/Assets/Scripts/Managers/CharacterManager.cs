using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    public class CharacterManager : MonoBehaviour
    {
        AnimatorManager animatorManager;
        CharacterWeaponSlotManager characterWeaponSlotManager;

        [Header("Lock On Transform")]
        public Transform lockOnTransform;

        [Header("Combat Colliders")]
        public CriticalDamageColliders backStabCollider;
        public CriticalDamageColliders riposteCollider;

        [Header("Interacting")]
        public bool isInteracting;

        [Header("Combat Flags")]
        public bool canDoCombo;
        public bool isUsingRightHand;
        public bool isUsingLeftHand;
        public bool isTwoHanding;
        public bool canBeRiposted;
        public bool isParrying;
        public bool canBeParried;
        public bool isBlocking;
        public bool isAttacking;
        public bool isInvulnerable;

        [Header("Movement Flags")]
        public bool isRotatingWithRootMotion;
        public bool canRotate;
        public bool isSprinting;
        public bool isInAir;
        public bool isGrounded;

        [Header("Spells")]
        public bool isFiringSpell;

        //Damage will be inflicted during an animation event
        //Happens during backstab or riposte animations
        public int pendingCriticalDamage;

        protected virtual void Awake()
        {
            animatorManager = GetComponent<AnimatorManager>();
            characterWeaponSlotManager = GetComponent<CharacterWeaponSlotManager>();
        }

        protected virtual void FixedUpdate()
        {
            animatorManager.CheckHandIKWeight(characterWeaponSlotManager.rightHandIKTarget, characterWeaponSlotManager.leftHandIKTarget, isTwoHanding);
        }
    }
}