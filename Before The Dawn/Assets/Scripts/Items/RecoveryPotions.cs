using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    [CreateAssetMenu(menuName = "Item/Consumables/Potion")]
    public class RecoveryPotions : ConsumableItem
    {
        [Header("Potion Type")]
        public bool healthPotion;
        public bool FocusPotion;

        [Header("Recovery Amount")]
        public int healthRecoveryAmount;
        public int focusRecoveryAmount;

        [Header("Recovery Effects")]
        public GameObject recoveryFX;

        public override void AttemptToConsumeItem(AnimatorHandler animatorHandler, WeaponSlotManager weaponSlotManager, PlayerFXManager playerFXManager)
        {
            base.AttemptToConsumeItem(animatorHandler, weaponSlotManager, playerFXManager);
            GameObject potion = Instantiate(itemModel, weaponSlotManager.rightHandSlot.transform);

            if (isHealthPotion)
            {                
                playerFXManager.currentParticleFX = recoveryFX;
                playerFXManager.amountToBeRecovered = healthRecoveryAmount;
                weaponSlotManager.rightHandSlot.UnloadWeapon();
                playerFXManager.instantiatedFXModel = potion;
            }
            else if (isFocusPotion)
            {               
                playerFXManager.currentParticleFX = recoveryFX;
                playerFXManager.amountToBeRecovered = focusRecoveryAmount;
                weaponSlotManager.rightHandSlot.UnloadWeapon();
                playerFXManager.instantiatedFXModel = potion;
            }


            //play recovery FX when/if we play animation without being hit
        }
    }
}
