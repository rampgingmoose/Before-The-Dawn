using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    public class EnemyAnimatorManager : AnimatorManager
    {
        EnemyBossManager enemyBossManager;
        EnemyFXManager enemyFXManager;
        EnemyManager enemyManager;

        protected override void Awake()
        {
            base.Awake();
            animator = GetComponent<Animator>();
            enemyBossManager = GetComponent<EnemyBossManager>();
            enemyManager = GetComponent<EnemyManager>();
            enemyFXManager = GetComponent<EnemyFXManager>();
        }

        public void AwardSoulsOnDeath()
        {

            PlayerStatsManager playerStats = FindObjectOfType<PlayerStatsManager>();
            SoulCountBar soulCountBar = FindObjectOfType<SoulCountBar>();

            if (playerStats != null)
            {
                playerStats.AddSouls(characterStatsManager.soulsAwardedOnDeath);


                if (soulCountBar != null)
                {
                    soulCountBar.SetSoulCountText(playerStats.soulCount);
                }
            }
        }

        public void InstantiateBossParticleFX()
        {
            WeaponFXTransform weaponFXTransform = GetComponentInChildren<WeaponFXTransform>();
            GameObject phaseFX = Instantiate(enemyBossManager.particleFX, weaponFXTransform.transform);
        }

        public void PlayWeaponTrailFX()
        {
            enemyFXManager.PlayWeaponFX(false);
        }

        private void OnAnimatorMove()
        {
            float delta = Time.deltaTime;
            enemyManager.enemyRigidBody.drag = 0;
            Vector3 deltaPosition = animator.deltaPosition;
            deltaPosition.y = 0;
            Vector3 velocity = deltaPosition / delta;
            enemyManager.enemyRigidBody.velocity = velocity;

            if (enemyManager.isRotatingWithRootMotion)
            {
                enemyManager.transform.rotation *= animator.deltaRotation;
            }
        }
    }
}
