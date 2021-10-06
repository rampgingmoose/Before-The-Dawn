using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    [CreateAssetMenu(menuName = "Items/Weapon")]
    public class WeaponItem : Item
    {
        public GameObject modelPrefab;
        public bool isUnarmed;

        [Header("Damage")]
        public int baseDamage = 25;
        public int CriticalDamageMultiplier = 4;

        [Header("Poise")]
        public float poiseBreak;
        public float offensivePoiseBonus;

        [Header("Absoption")]
        public float physicalDamageAbsoption;

        [Header("Idle Animations")]
        public string right_Hand_Idle;
        public string left_Hand_Idle;
        public string th_Idle; //Two Handed Idle

        [Header("One Handed Attack Animation")]
        public string OH_Light_Attack_01;
        public string OH_Light_Attack_02;
        public string OH_Heavy_Attack_01;
        public string OH_Heavy_Attack_02;
        public string OH_Special_Attack;

        [Header ("Two Handed Attack Animation")]
        public string TH_Light_Attack_01;
        public string TH_Light_Attack_02;
        public string TH_Heavy_Attack_01;
        public string TH_Heavy_Attack_02;

        [Header("WeaponArt")]
        public string weapon_Art;

        [Header("Stamina Cost")]
        public int baseStamina;
        public float lightAttackMultiplier;
        public float heavyAttackMultiplier;

        [Header("Weapon Type")]
        public bool isSpellCaster;
        public bool isFaithCaster;
        public bool isPryroCaster;
        public bool isMeleeWeapon;
        public bool isShieldWeapon;
    }
}
