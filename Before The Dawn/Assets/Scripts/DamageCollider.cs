using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    public class DamageCollider : MonoBehaviour
    {
        public CharacterManager characterManager;
        public Collider damageCollider;
        EnemyStatsManager enemyStats;

        public bool enabledDamageColliderOnStartUp = false;

        [Header("Team I.D")]
        public int teamIDNumber = 0;

        [Header("Poise")]
        public float poiseBreak;
        public float offensivePoiseBonus;

        [Header("Damage")]
        public int physicalDamage;
        public int fireDamage;
        public int magicDamage;
        public int lightningDamage;
        public int darkDamage;

        bool shieldHasBeenHit = false;
        bool hasBeenParried = false;
        protected string currentDamageAnimation;

        protected virtual void Awake()
        {
            damageCollider = GetComponent<Collider>();
            enemyStats = GetComponentInParent<EnemyStatsManager>();
            damageCollider.gameObject.SetActive(true);
            damageCollider.isTrigger = true;
            damageCollider.enabled = enabledDamageColliderOnStartUp;
        }

        public void EnableDamageCollider()
        {
            damageCollider.enabled = true;
        }

        public void DisableDamageCollider()
        {
            damageCollider.enabled = false;
        }

        private void OnTriggerEnter(Collider collision)
        {
            if (collision.tag == "Character")
            {
                //Player and Enemy AI share this logic so enemy naming convention means "the enemy of the entity dealing the damage"
                shieldHasBeenHit = false;
                hasBeenParried = false;
                CharacterStatsManager enemyStats = collision.GetComponent<CharacterStatsManager>();
                CharacterManager enemyCharacterManager = collision.GetComponent<CharacterManager>();
                CharacterFXManager enemyFXManager = collision.GetComponent<CharacterFXManager>();
                BlockingCollider shield = collision.transform.GetComponentInChildren<BlockingCollider>();

                if (enemyCharacterManager != null)
                {
                    if (enemyStats.teamIDNumber == teamIDNumber)
                        return;

                    CheckForParry(enemyCharacterManager);
                    CheckForBlock(enemyCharacterManager, enemyStats, shield);
                }


                if (enemyStats != null)
                {
                    if (enemyStats.teamIDNumber == teamIDNumber)
                        return;

                    if (hasBeenParried)
                        return;

                    if (shieldHasBeenHit)
                        return;

                    enemyStats.poiseResetTimer = enemyStats.totalPoiseResetTime;
                    enemyStats.totalPoiseDefense = enemyStats.totalPoiseDefense - poiseBreak;

                    //detects where on the collider our weapon first makes contact
                    Vector3 contactPoint = collision.gameObject.GetComponent<Collider>().ClosestPointOnBounds(transform.position);
                    float directionHitFrom = (Vector3.SignedAngle(characterManager.transform.forward, enemyCharacterManager.transform.forward, Vector3.up));
                    ChooseWhichDirectionDamageCameFrom(directionHitFrom);
                    enemyFXManager.PlayBloodSplatterFX(contactPoint);

                    if (enemyStats.totalPoiseDefense > poiseBreak)
                    {
                        DisableDamageCollider();
                        enemyStats.TakeDamageNoAnimation(physicalDamage, 0);
                    }
                    else
                    {
                        DisableDamageCollider();
                        enemyStats.TakeDamage(physicalDamage, 0, currentDamageAnimation);
                    }
                }
            }

            if(collision.tag == "Illusionary Wall")
            {
                IllusionaryWall illusionaryWall = collision.GetComponent<IllusionaryWall>();

                illusionaryWall.wallHasBeenHit = true;
            }
        }

        protected virtual void CheckForParry(CharacterManager enemyCharacterManager)
        {
            if (enemyCharacterManager.isParrying)
            {
                characterManager.GetComponentInChildren<AnimatorManager>().PlayTargetAnimation("Parried", true);
                hasBeenParried = true;
            }
        }

        protected virtual void CheckForBlock(CharacterManager enemyCharacterManager, CharacterStatsManager enemyStats, BlockingCollider shield)
        {
            if (shield != null && enemyCharacterManager.isBlocking)
            {
                float physicalDamageAfterBlock = physicalDamage - (physicalDamage * shield.blockingPhysicalDamageAbsorption) / 100;
                float fireDamageAfterBlock = fireDamage - (fireDamage * shield.blockingFireDamageAbsorption) / 100;

                if (enemyStats != null)
                {
                    enemyStats.TakeDamage(Mathf.RoundToInt(physicalDamageAfterBlock), Mathf.RoundToInt(fireDamageAfterBlock), "Block Guard");
                    shieldHasBeenHit = true;
                }
            }
        }

        protected virtual void ChooseWhichDirectionDamageCameFrom(float direction)
        {
            if (direction >= 145 && direction <= 180)
            {
                currentDamageAnimation = "Damage_Forward_01";
            }
            else if (direction <= -145 && direction >= -180)
            {
                currentDamageAnimation = "Damage_Forward_01";
            }
            else if (direction >= -45 && direction <= 45)
            {
                currentDamageAnimation = "Damage_Back_01";
            }
            else if (direction >= -144 && direction <= -45)
            {
                currentDamageAnimation = "Damage_Left_01";
            }
            else if (direction >= 45 && direction <= 144)
            {
                currentDamageAnimation = "Damage_Right_01";
            }
            else
            {
                currentDamageAnimation = "Damage_01";
            }
        }
    }
}

