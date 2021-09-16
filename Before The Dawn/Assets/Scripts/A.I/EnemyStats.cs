using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    public class EnemyStats : CharacterStats
    {
        Animator animator;
        EnemyAnimatorHandler enemyAnimatorHandler;
        EnemyBossManager enemyBossManager;
        EnemyManager enemyManager;
        WeaponSlotManager weaponSlotManager;
        PlayerEquipmentManager playerEquipmentManager;
        PlayerInventory playerInventory;

        public EnemyHealthBar enemyHealthBar;
        public GameObject enemyHealthBarUI;

        public bool isBoss;

        private void Awake()
        {
            animator = GetComponentInChildren<Animator>();
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

            enemyHealthBarUI.SetActive(true);
            enemyHealthBar.SetCurrentHealth(currentHealth);

            if (currentHealth <= 0)
            {
                currentHealth = 0;
                isDead = true;
            }
        }

        public override void TakeDamage(int damage, string damageAnimation = "Damage_01")
        {
            if (isDead)
                return;

            currentHealth = currentHealth - damage;

            if (!isBoss)
            {
                enemyHealthBar.SetCurrentHealth(currentHealth);
                enemyHealthBarUI.SetActive(true);
            }
            else if (isBoss && enemyBossManager != null)
            {
                enemyBossManager.UpdateBossHealthBar(currentHealth);
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
            isDead = true;
        }       
    }
}
