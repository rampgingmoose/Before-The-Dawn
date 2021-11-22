using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    [CreateAssetMenu(menuName = "Item/Consumables/Cure Effect Clump")]

    public class ClumpConsumableItem : ConsumableItem
    {
        [Header("Recovery Effects")]
        public GameObject clumpConsumeFX;

        [Header("Cure FX")]
        public bool curePoison;
        //Cure Bleed
        //Cure Burn etc

        public override void AttemptToConsumeItem(PlayerAnimatorManager animatorHandler, PlayerWeaponSlotManager weaponSlotManager, PlayerFXManager playerFXManager)
        {
            base.AttemptToConsumeItem(animatorHandler, weaponSlotManager, playerFXManager);
            GameObject clump = Instantiate(itemModel, weaponSlotManager.rightHandSlot.transform);

            playerFXManager.currentParticleFX = clumpConsumeFX;
            playerFXManager.instantiatedFXModel = clump;
            weaponSlotManager.rightHandSlot.UnloadWeapon();
            if (curePoison)
            {
                playerFXManager.poisonBuildUp = 0;
                playerFXManager.poisonAmount = playerFXManager.defaultPoisonAmount;
                playerFXManager.isPoisoned = false;

                if (playerFXManager.currentPoisonParticleFX != null)
                {
                    Destroy(playerFXManager.currentPoisonParticleFX);
                }
            }
        }
    }
}
