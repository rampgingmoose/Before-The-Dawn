using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

namespace ST
{
    public class EnemyAnimatorManager : AnimatorManager
    {
        EnemyBossManager enemyBossManager;
        EnemyFXManager enemyFXManager;
        EnemyManager enemyManager;

        [SerializeField] int dashSpeed = 30;
        Vector3 dashOffSet = new Vector3(0, 0, 2);

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

        public void SpawnEarthShatter() 
        {
            Quaternion bossRotation = enemyFXManager.earthShatterSpawnTransform.rotation;
            Vector3 spawnPos = enemyFXManager.earthShatterSpawnTransform.position;

            GameObject earthShatter = Instantiate(enemyFXManager.earthShatterParticleFX, spawnPos, bossRotation);
            earthShatter.GetComponent<DamageCollider>().EnableDamageCollider();
            Destroy(earthShatter, 7);
        }

        public void SwordsFromSkyAttack() 
        {
            StartCoroutine(DropSwordsFromSky(15));
        }

        public IEnumerator DropSwordsFromSky(int counter)
        {
            float x_offset = Random.Range(-1, 1); 
            float z_offset = Random.Range(-1, 1); 
            GameObject meteorAttack = Instantiate(enemyFXManager.meteorParticles, new Vector3(enemyManager.currentTarget.transform.position.x + x_offset,
                enemyManager.currentTarget.transform.position.y, enemyManager.currentTarget.transform.position.z + z_offset), Quaternion.identity);
            yield return new WaitForSeconds(0.2f); 
            meteorAttack.GetComponent<DamageCollider>().EnableDamageCollider();
            yield return new WaitForSeconds(0.25f);
            if (counter > 0)
            {
                StartCoroutine(DropSwordsFromSky(counter - 1));
            }
            yield return new WaitForSeconds(0.4f);
            Destroy(meteorAttack);
        }

        public void DoTweenDashAttack()
        {
            animator.speed = 0;

            transform.DOMove(enemyManager.currentTarget.transform.position, dashSpeed).SetSpeedBased(true).OnComplete(() => FinishDash());

            enemyFXManager.smokeParticles.Play();
        }

        public void FinishDash()
        {
            StartCoroutine(FinishDashAnimation());
            StartCoroutine(StopDashParticles());
        }

        IEnumerator FinishDashAnimation()
        {
            yield return new WaitForSeconds(.2f);
            animator.speed = 1;
        }

        IEnumerator StopDashParticles()
        {
            yield return new WaitForSeconds(.2f);
            enemyFXManager.smokeParticles.Stop();
        }

        public void PlayWeaponTrailFX()
        {
            enemyFXManager.PlayWeaponFX(false);
        }

        private void OnAnimatorMove()
        {
            //float delta = Time.deltaTime;
            //enemyManager.enemyRigidBody.drag = 0;
            //Vector3 deltaPosition = Anim.deltaPosition;
            //deltaPosition.y = -0.1f;
            //Vector3 velocity = deltaPosition / delta;
            //enemyManager.enemyRigidBody.velocity = velocity;
            if (Time.deltaTime > 0)
            {
                enemyManager.enemyRigidBody.isKinematic = false;
                var velocity = animator.deltaPosition / Time.deltaTime;

                // Keep y part of velocity.
                velocity.y = enemyManager.enemyRigidBody.velocity.y;
                enemyManager.enemyRigidBody.velocity = velocity;
            }


            if (enemyManager.isRotatingWithRootMotion)
            {
                enemyManager.transform.rotation *= animator.deltaRotation;
            }
        }
    }
}
