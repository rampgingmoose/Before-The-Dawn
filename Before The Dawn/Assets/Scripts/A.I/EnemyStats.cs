using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    public class EnemyStats : CharacterStats
    {
        Animator animator;
        EnemyAnimatorHandler enemyAnimatorHandler;
        WeaponSlotManager weaponSlotManager;

        public EnemyHealthBar enemyHealthBar;
        public GameObject enemyHealthBarUI;

        private void Awake()
        {
            animator = GetComponentInChildren<Animator>();
            enemyAnimatorHandler = GetComponentInChildren<EnemyAnimatorHandler>();
            weaponSlotManager = GetComponent<WeaponSlotManager>();
            enemyHealthBar = GetComponentInChildren<EnemyHealthBar>();
        }

        private void Start()
        {
            maxHealth = SetMaxHealthFromHealthLevel();
            currentHealth = maxHealth;
            enemyHealthBar.SetMaxHealth(maxHealth);
        }

        private int SetMaxHealthFromHealthLevel()
        {
            maxHealth = healthLevel * 10;
            return maxHealth;
        }

        public void TakeDamageNoAnimation(int damage)
        {
            currentHealth = currentHealth - damage;

            enemyHealthBarUI.SetActive(true);
            enemyHealthBar.SetCurrentHealth(currentHealth);

            if (currentHealth <= 0)
            {
                currentHealth = 0;
                isDead = true;
            }
        }

        public void TakeDamage(int damage, string damageAnimation = "Damage_01")
        {
            if (isDead)
                return;

            currentHealth = currentHealth - damage;

            enemyHealthBarUI.SetActive(true);
            enemyHealthBar.SetCurrentHealth(currentHealth);

            enemyAnimatorHandler.PlayTargetAnimation(damageAnimation, true);

            if(currentHealth <= 0)
            {
                HandleDeath();
            }
        }

        private void HandleDeath()
        {
            currentHealth = 0;
            enemyAnimatorHandler.PlayTargetAnimation("Death_01", true);
            isDead = true;
        }
    }
}
