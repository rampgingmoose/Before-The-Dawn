using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    public class ConsumableItem : Item
    {
        [Header("Item Quantity")]
        public int maxItemAmount = 10;
        public int currentItemAmount;

        [Header("Item Model")]
        public GameObject itemModel;
        public bool isHealthPotion;
        public bool isFocusPotion;

        [Header("Animations")]
        public string consumeAnimation;
        public bool isInteracting;

        public virtual void Start()
        {
            currentItemAmount = maxItemAmount;
        }

        public virtual void AttemptToConsumeItem(PlayerAnimatorManager animatorHandler, PlayerWeaponSlotManager weaponSlotManager, PlayerFXManager playerFXManager)
        {
            if(currentItemAmount > 0)
            {
                animatorHandler.PlayTargetAnimation(consumeAnimation, isInteracting, true);
                currentItemAmount = Mathf.RoundToInt(currentItemAmount - 1);
            }
            else
            {
                animatorHandler.PlayTargetAnimation("Shrug", true);
            }
        }
    }
}
