using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    public class CharacterStats : MonoBehaviour
    {
        public int healthLevel = 10;
        public int maxHealth;
        public int currentHealth;

        public int staminaLevel = 10;
        public float maxStamina;
        public float currentStamina;

        public int focusLevel = 10;
        public float maxFocus;
        public float currentFocus;

        public int soulCount = 0;

        [Header("Poise")]
        public float totalPoiseDefense; //The TOTAL poise that will be calculated after you've taken damage
        public float offensivePoiseBonus; //The poise you GAIN during any an attack with a weapon
        public float armorPoiseBonus; //The poise you GAIN from wearing what ever armor you have equipped
        public float totalPoiseResetTime = 15;
        public float poiseResetTimer = 0;

        public bool isDead;

        protected virtual void Update()
        {
            HandlePoiseResetTimer();
        }

        private void Start()
        {
            totalPoiseDefense = armorPoiseBonus;
        }

        public virtual void TakeDamage(int damage, string damageAnimation = "Damage_01")
        {

        }

        public virtual void HandlePoiseResetTimer()
        {
            if (poiseResetTimer > 0)
            {
                poiseResetTimer = poiseResetTimer - Time.deltaTime;
            }
            else
            {
                totalPoiseDefense = armorPoiseBonus;
            }
        }
    }
}
