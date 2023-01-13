using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

namespace ST
{
    public class CombatStanceState : State
    {
        public AttackState attackState;
        public EnemyAttackAction[] enemyAttacks;
        public PursueTargetState pursueTargetState;
        public IdleState idleState;

        DamageCollider weaponCollider;

        protected bool randomDestinationSet = false;
        protected float verticalMovementValue = 0;
        protected float horizontalMovementValue = 0;
        protected float rollTimer;

        protected float MinDashDistance = 5f;
        protected float MaxDashDistance = 12f;
        protected float DashSpeed = 4f;
        protected float dashAttackTimer;

        public override State Tick(EnemyManager enemyManager, EnemyStatsManager enemyStats, EnemyAnimatorManager enemyAnimatorManager)
        {
            float distanceFromTarget = Vector3.Distance(enemyManager.currentTarget.transform.position, enemyManager.transform.position);
            enemyAnimatorManager.animator.SetFloat("Vertical", verticalMovementValue, 0.2f, Time.deltaTime);
            enemyAnimatorManager.animator.SetFloat("Horizontal", horizontalMovementValue, 0.2f, Time.deltaTime);
            attackState.hasPerformedAttack = false;

            if (enemyManager.isInteracting)
            {
                enemyAnimatorManager.animator.SetFloat("Vertical", 0);
                enemyAnimatorManager.animator.SetFloat("Horizontal", 0);
                return this;
            }

            if (enemyManager.currentTarget.isDead)
            {
                return idleState;
            }

            if (distanceFromTarget > enemyManager.maximumAggroRadius)
            {
                return pursueTargetState;
            }

            if (!randomDestinationSet)
            {
                randomDestinationSet = true;
                DecideCirclingAction(enemyAnimatorManager);
            }

            HandleRotateTowardsTarget(enemyManager);
           
            HandleDodgingAttack(enemyManager, enemyAnimatorManager);

            //if (!enemyManager.isInteracting && distanceFromTarget >= MinDashDistance && distanceFromTarget <= MaxDashDistance)
            //{
            //    if (dashAttackTimer <= 0)
            //    {
            //        enemyAnimatorManager.PlayTargetAnimation("Start_Dash_Attack", true);
            //        dashAttackTimer = 5f;
            //    }
            //    else
            //    {
            //        dashAttackTimer -= Time.deltaTime;
            //    }
            //}

            if (enemyManager.currentRecoveryTime <= 0 && attackState.currentAttack != null)
            {
                randomDestinationSet = false;
                return attackState;
            }
            else
            {
                GetNewAttack(enemyManager);
            }

            return this;
        }

        protected void HandleDodgingAttack(EnemyManager enemyManager, EnemyAnimatorManager enemyAnimatorManager)
        {
            if (!enemyManager.isInteracting && enemyManager.currentTarget.isAttacking)
            {
                float dodgeChance = Random.Range(0, 100);

                if (dodgeChance <= 20 && rollTimer <= 0)
                {
                    enemyAnimatorManager.PlayTargetAnimation("Backstep", true);
                    rollTimer = 1f;
                }
                else
                {
                    rollTimer -= Time.deltaTime;
                }
            }
        }


        //protected IEnumerator DashAttack(EnemyManager enemyManager, EnemyAnimatorManager enemyAnimatorManager)
        //{
        //    enemyManager.navmeshAgent.enabled = false;
        //    enemyManager.canRotate = false;

        //    Vector3 startingPos = enemyManager.transform.position;

        //    float waitTime = 1.4f;
        //    enemyAnimatorManager.Anim.SetBool("isUsingAbility", true);

        //    enemyAnimatorManager.PlayTargetAnimation("Start_Dash_Attack", true);

        //    yield return new WaitForSeconds(waitTime);

        //    for (float time = 0; time < 1; time += Time.deltaTime * DashSpeed)
        //    {
        //        enemyManager.GetComponentInChildren<DamageCollider>().EnableDamageCollider();
        //        Vector3 enemyPosOffset = enemyManager.currentTarget.transform.position - new Vector3(0, 0, 1);

        //        enemyManager.transform.position = Vector3.Lerp(startingPos, enemyPosOffset, time);
        //        enemyManager.transform.rotation = Quaternion.Slerp(enemyManager.transform.rotation, Quaternion.LookRotation(enemyManager.currentTarget.transform.position - enemyManager.transform.position), time);

        //        yield return null;
        //    }

        //    enemyAnimatorManager.Anim.SetBool("isUsingAbility", false);
        //    enemyManager.navmeshAgent.enabled = true;
        //    enemyManager.canRotate = true;
        //    //enemyManager.GetComponentInChildren<DamageCollider>().DisableDamageCollider();

        //    yield return new WaitForSeconds(waitTime);

        //    if (NavMesh.SamplePosition(enemyManager.currentTarget.transform.position, out NavMeshHit hit, 1f, enemyManager.navmeshAgent.areaMask))
        //    {
        //        enemyManager.navmeshAgent.Warp(hit.position);
        //        enemyManager.currentState = this;
        //    }
        //}

        protected void HandleRotateTowardsTarget(EnemyManager enemyManager)
        {
            //Rotate manually
            if (enemyManager.isPerformingAction)
            {
                Vector3 direction = enemyManager.currentTarget.transform.position - transform.position;
                direction.y = 0;
                direction.Normalize();

                if (direction == Vector3.zero)
                {
                    direction = transform.forward;
                }

                Quaternion targetRotation = Quaternion.LookRotation(direction);
                enemyManager.transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, enemyManager.rotationSpeed * Time.deltaTime);
            }
            //Rotate with pathfinding (navmesh)
            else
            {
                Vector3 relativeDirection = transform.InverseTransformDirection(enemyManager.navmeshAgent.desiredVelocity);
                Vector3 targetVelocity = enemyManager.enemyRigidBody.velocity;

                enemyManager.navmeshAgent.enabled = true;
                enemyManager.navmeshAgent.SetDestination(enemyManager.currentTarget.transform.position);
                enemyManager.enemyRigidBody.velocity = targetVelocity;
                enemyManager.transform.rotation = Quaternion.Slerp(enemyManager.transform.rotation, enemyManager.navmeshAgent.transform.rotation, enemyManager.rotationSpeed * Time.deltaTime);
            }
        }

        protected void DecideCirclingAction(EnemyAnimatorManager enemyAnimatorHandler)
        {
            //Circle with only forward vertical movement
            //Circle with running
            WalkAroundTarget(enemyAnimatorHandler);
        }

        protected void WalkAroundTarget(EnemyAnimatorManager enemyAnimatorHandler)
        {
            verticalMovementValue = 0.5f;

            horizontalMovementValue = Random.Range(-1, 1);

            if (horizontalMovementValue <= 1 && horizontalMovementValue >= 0)
            {
                horizontalMovementValue = 0.5f;
            }
            else if (horizontalMovementValue >= -1 && horizontalMovementValue < 0)
            {
                horizontalMovementValue = -0.5f;
            }
        }

        protected virtual void GetNewAttack(EnemyManager enemyManager)
        {
            Vector3 targetsDirection = enemyManager.currentTarget.transform.position - transform.position;
            float viewableAngle = Vector3.Angle(targetsDirection, transform.forward);
            float distanceFromTarget = Vector3.Distance(enemyManager.currentTarget.transform.position, transform.position);

            int maxScore = 0;

            for (int i = 0; i < enemyAttacks.Length; i++)
            {
                EnemyAttackAction enemyAttackAction = enemyAttacks[i];

                if (distanceFromTarget <= enemyAttackAction.maximumDistanceNeededToAttack
                    && distanceFromTarget >= enemyAttackAction.minimumDistanceNeededToAttack)
                {
                    if (viewableAngle <= enemyAttackAction.maximumAttackAngle
                    && viewableAngle >= enemyAttackAction.minimumAttackAngle)
                    {
                        maxScore += enemyAttackAction.attackScore;
                    }
                }
            }


            int randomValue = Random.Range(0, maxScore);
            int temporaryScore = 0;

            for (int i = 0; i < enemyAttacks.Length; i++)
            {
                EnemyAttackAction enemyAttackAction = enemyAttacks[i];

                if (distanceFromTarget <= enemyAttackAction.maximumDistanceNeededToAttack
                && distanceFromTarget >= enemyAttackAction.minimumDistanceNeededToAttack)
                {
                    if (viewableAngle <= enemyAttackAction.maximumAttackAngle
                    && viewableAngle >= enemyAttackAction.minimumAttackAngle)
                    {
                        if (attackState.currentAttack != null)
                            return;

                        temporaryScore += enemyAttackAction.attackScore;

                        if (temporaryScore > randomValue)
                        {
                            attackState.currentAttack = enemyAttackAction;
                        }
                    }
                }
            }
        }
    }
}
