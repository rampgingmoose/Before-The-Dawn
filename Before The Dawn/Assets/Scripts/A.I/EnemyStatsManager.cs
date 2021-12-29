using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    public class EnemyStatsManager : CharacterStatsManager
    {
        EnemyAnimatorManager enemyAnimatorHandler;
        EnemyBossManager enemyBossManager;
        EnemyManager enemyManager;


        public EnemyHealthBar enemyHealthBar;
        public GameObject enemyHealthBarUI;

        public bool isBoss;
        public bool attackIsInterrupted = false;

        protected override void Awake()
        {
            base.Awake();
            enemyAnimatorHandler = GetComponent<EnemyAnimatorManager>();
            enemyBossManager = GetComponent<EnemyBossManager>();
            enemyManager = GetComponent<EnemyManager>();
            enemyHealthBar = GetComponentInChildren<EnemyHealthBar>();
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

        public override void HandlePoiseResetTimer()
        {
            if (poiseResetTimer > 0)
            {
                poiseResetTimer = poiseResetTimer - Time.deltaTime;
            }
            else if(poiseResetTimer <= 0 && !enemyManager.isInteracting)
            {
                totalPoiseDefense = armorPoiseBonus;
            }
        }

        private int SetMaxHealthFromHealthLevel()
        {
            maxHealth = healthLevel * 10;
            return maxHealth;
        }

        public override void TakeDamageNoAnimation(int physicalDamage, int fireDamage)
        {
            if (isDead)
                return;

            base.TakeDamageNoAnimation(physicalDamage, fireDamage);

            if (!isBoss)
            {
                enemyHealthBarUI.SetActive(true);
                enemyHealthBar.SetCurrentHealth(currentHealth);
            }
            else if (isBoss && enemyBossManager != null)
            {
                enemyBossManager.UpdateBossHealthBar(currentHealth, maxHealth);
            }
        }

        public override void TakePoisonDamage(int damage)
        {
            if (isDead)
                return;

            base.TakePoisonDamage(damage);

            if (!isBoss)
            {
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

        public void GuardBreak()
        {
            enemyAnimatorHandler.PlayTargetAnimation("Guard Break", true);
        }

        public override void TakeDamage(int physicalDamage, int fireDamage, string damageAnimation = "Damage_01")
        {
            if (isDead)
                return;

            if (enemyManager.isPhaseShifting)
            {
                TakeDamageNoAnimation(physicalDamage,fireDamage);
            }
            else
            {
                base.TakeDamage(physicalDamage, fireDamage, damageAnimation = "Damage_01");
                attackIsInterrupted = true;
            }

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
            enemyAnimatorHandler.animator.SetFloat("Vertical", 0);
            enemyAnimatorHandler.animator.SetFloat("Horizontal", 0);
            isDead = true;
        }       
    }
}
