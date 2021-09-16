using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    public class SpellItem : Item
    {
        public GameObject spellWarmUpFX;
        public GameObject spellCastFX;

        public string spellAnimation;

        [Header("Spell Cost")]
        public int focusCost;

        [Header("Spell Type")]
        public bool isFaithSpell;
        public bool isMagicSpell;
        public bool isPyroSpell;

        [Header("Spell Description")]
        [TextArea]
        public string spellDescription;

        public virtual void AttemptToCastSpell(AnimatorHandler animatorHandler, PlayerStats playerStats, WeaponSlotManager weaponSlotManager)
        {
            Debug.Log("You Attempt To Cast a Spell");
        }

        public virtual void SuccessfullyCastSpell(AnimatorHandler animatorHandler, PlayerStats playerStats, CameraHandler cameraHandler, WeaponSlotManager weaponSlotManager)
        {
            Debug.Log("You successfully cast a spell");
            playerStats.DrainFocusPoints(focusCost);
        }
    }
}