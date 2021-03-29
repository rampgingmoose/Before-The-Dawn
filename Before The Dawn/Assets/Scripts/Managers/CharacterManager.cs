using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    public class CharacterManager : MonoBehaviour
    {
        [Header("Lock On Transform")]
        public Transform lockOnTransform;

        [Header("Combat Colliders")]
        public CriticalDamageColliders backStabCollider;
        public CriticalDamageColliders riposteCollider;

        [Header("Combat Flags")]
        public bool canBeRiposted;
        public bool isParrying;
        public bool canBeParried;
        public bool isBlocking;

        //Damage will be inflicted during an animation event
        //Happens during backstab or riposte animations
        public int pendingCriticalDamage;
    }
}