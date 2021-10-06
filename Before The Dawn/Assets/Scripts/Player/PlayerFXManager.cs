using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    public class PlayerFXManager : MonoBehaviour
    {
        PlayerStats playerStats;
        WeaponSlotManager weaponSlotManager;
        public GameObject currentParticleFX; //The particles that will play of the current effect that is effecting the player
        public GameObject instantiatedFXModel;
        public int amountToBeRecovered;

        private void Awake()
        {
            playerStats = GetComponentInParent<PlayerStats>();
            weaponSlotManager = GetComponent<WeaponSlotManager>();
        }
        public void HealPlayerFromEffect()
        {
            playerStats.HealPlayer(amountToBeRecovered);
            GameObject healParticles = Instantiate(currentParticleFX, playerStats.transform);
            Destroy(instantiatedFXModel.gameObject);
            weaponSlotManager.LoadBothWeaponsOnSlots();
        }
    }
}
