using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    public class EnemyStats : CharacterStats
    {
        Animator animator;
        WeaponSlotManager weaponSlotManager;

        public EnemyHealthBar enemyHealthBar;
        public GameObject enemyHealthBarUI;

        private void Awake()
        {
            animator = GetComponentInChildren<Animator>();
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

        public void TakeDamage(int damage)
        {
            if (isDead)
                return;

            currentHealth = currentHealth - damage;

            enemyHealthBarUI.SetActive(true);
            enemyHealthBar.SetCurrentHealth(currentHealth);

            animator.Play("Damage_01");

            if(currentHealth <= 0)
            {
                currentHealth = 0;
                animator.Play("Death_01");
                isDead = true;
            }
        }
    }
}
