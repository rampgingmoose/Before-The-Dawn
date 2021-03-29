using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    public class PlayerEquipmentManager : MonoBehaviour
    {
        InputHandler inputHandler;
        public BlockingCollider blockingCollider;
        PlayerInventory playerInventory;

        private void Awake()
        {
            playerInventory = GetComponentInParent<PlayerInventory>();
            inputHandler = GetComponentInParent<InputHandler>();
        }

        public void OpenBlockingCollider()
        {
            blockingCollider.SetColliderDamageAbsorption(playerInventory.leftWeapon);
            blockingCollider.EnableBlockingCollider();
        }

        public void CloseBlockingCollider()
        {
            blockingCollider.DisableBlockingCollider();
        }
    }
}
