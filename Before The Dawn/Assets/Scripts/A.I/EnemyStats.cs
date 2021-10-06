using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    public class EnemyStats : CharacterStats
    {
        EnemyAnimatorHandler enemyAnimatorHandler;
        EnemyBossManager enemyBossManager;
        EnemyManager enemyManager;
        WeaponSlotManager weaponSlotManager;
        PlayerEquipmentManager playerEquipmentManager;
        PlayerInventory playerInventory;

        public EnemyHealthBar enemyHealthBar;
        public GameObject enemyHealthBarUI;

        public int soulsAwardedOnDeath = 50;

        public bool isBoss;

        private void Awake()
        {
            enemyAnimatorHandler = GetComponentInChildren<EnemyAnimatorHandler>();
            enemyBossManager = GetComponent<EnemyBossManager>();
            enemyManager = GetComponent<EnemyManager>();
            weaponSlotManager = GetComponent<WeaponSlotManager>();
            enemyHealthBar = GetComponentInChildren<EnemyHealthBar>();
            playerEquipmentManager = GetComponent<PlayerEquipmentManager>();
            playerInventory = GetComponent<PlayerInventory>();
            maxHealth = SetMaxHealthFromHealthLevel();
            currentHealth = maxHealth;
        }

        private void Start()
        {           
            if (!isBoss)
            {
                enemyHealthBar.SetMaxHealth(maxHealth);
            }
        }

        private int SetMaxHealthFromHealthLevel()
        {
            maxHealth = healthLevel * 10;
            return maxHealth;
        }

        public void TakeDamageNoAnimation(int damage)
        {
            currentHealth = currentHealth - damage;

            if (!isBoss)
            {
                enemyHealthBarUI.SetActive(true);
                enemyHealthBar.SetCurrentHealth(currentHealth);
            }
            else if (isBoss && enemyBossManager != null)
            {
                enemyBossManager.UpdateBossHealthBar(currentHealth, maxHealth);
            }

            if (currentHealth <= 0)
            {
                HandleDeath();
            }
        }

        public override void TakeDamage(int damage, string damageAnimation = "Damage_01")
        {
            if (enemyManager.isPhaseShifting)
            {
                TakeDamageNoAnimation(damage);
            }
            else
            {
                base.TakeDamage(damage, damageAnimation = "Damage_01");
            }

            currentHealth = currentHealth - damage;

            if (!isBoss)
            {
                enemyHealthBar.SetCurrentHealth(currentHealth);
            }
            else if (isBoss && enemyBossManager != null)
            {
                enemyBossManager.UpdateBossHealthBar(currentHealth, maxHealth);
            }

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
            enemyAnimatorHandler.anim.SetFloat("Vertical", 0);
            enemyAnimatorHandler.anim.SetFloat("Horizontal", 0);
            isDead = true;
        }       
    }
}
