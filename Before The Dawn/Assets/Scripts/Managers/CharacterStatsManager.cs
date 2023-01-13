using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    public class CharacterStatsManager : MonoBehaviour
    {
        AnimatorManager animatorManager;
        [Header("Team I.D")]
        public int teamIDNumber = 0;

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

        public int soulsAwardedOnDeath = 50;

        public bool isAttacking;

        [Header("Poise")]
        public float totalPoiseDefense; //The TOTAL poise that will be calculated after you've taken physicalDamage
        public float offensivePoiseBonus; //The poise you GAIN during any an attack with a weapon
        public float armorPoiseBonus; //The poise you GAIN from wearing what ever armor you have equipped
        public float totalPoiseResetTime = 15;
        public float poiseResetTimer = 0;

        public bool isDead;

        protected virtual void Awake()
        {
            animatorManager = GetComponent<AnimatorManager>();
        }

        protected virtual void Update()
        {
            HandlePoiseResetTimer();
        }

        private void Start()
        {
            totalPoiseDefense = armorPoiseBonus;
        }

        public virtual void TakeDamage(int physicalDamage, int fireDamage, string currentDamageAnimation)
        {
            if (isDead)
                return;

            animatorManager.EraseHandIKForWeapon();

            float finalDamage = physicalDamage + fireDamage;

            currentHealth = Mathf.RoundToInt(currentHealth - finalDamage);

            if (currentHealth <= 0)
            {
                currentHealth = 0;
                isDead = true;
            }
        }

        public virtual void TakeDamageNoAnimation(int physicalDamage, int fireDamage)
        {
            if (isDead)
                return;

            float finalDamage = physicalDamage + fireDamage;

            currentHealth = Mathf.RoundToInt(currentHealth - finalDamage);

            if (currentHealth <= 0)
            {
                currentHealth = 0;
                isDead = true;
            }
        }

        public virtual void TakePoisonDamage(int damage)
        {
            currentHealth = currentHealth - damage;

            if (currentHealth <= 0)
            {
                currentHealth = 0;
                isDead = true;
            }
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
