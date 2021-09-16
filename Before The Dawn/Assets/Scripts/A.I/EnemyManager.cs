using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

namespace ST
{
    public class EnemyManager : CharacterManager
    {
        EnemyAnimatorHandler enemyAnimatorHandler;
        EnemyStats enemyStats;

        public State currentState;
        public CharacterStats currentTarget;
        public NavMeshAgent navmeshAgent;
        public Rigidbody enemyRigidBody;

        public bool isPerformingAction;
        public bool isInteracting;
        public float rotationSpeed = 15;
        public float maximumAggroRadius = 1.5f;

        [Header("Combat Flags")]
        public bool canDoCombo;

        [Header("A.I Settings")]
        public float detectionRadius = 20;
        //The higher, and lower, respectively these angles are, the greater detection FIELD OF VIEW (basically like eye sight)
        public float maximumDetectionAngle = 50;
        public float minimumDetectionAngle = -50;
        public float currentRecoveryTime = 0;

        [Header("AI Combat Settings")]
        public bool allowAIToPerformCombos;
        public float comboLikelyHood;

        private void Awake()
        {
            enemyAnimatorHandler = GetComponentInChildren<EnemyAnimatorHandler>();
            enemyStats = GetComponent<EnemyStats>();
            enemyRigidBody = GetComponent<Rigidbody>();
            backStabCollider = GetComponentInChildren<CriticalDamageColliders>();
            navmeshAgent = GetComponentInChildren<NavMeshAgent>();
            navmeshAgent.enabled = false;
        }

        private void Start()
        {
            enemyRigidBody.isKinematic = false;
        }

        private void Update()
        {
            HandleRecoveryTimer();
            HandleStateMachine();

            isRotatingWithRootMotion = enemyAnimatorHandler.anim.GetBool("isRotatingWithRootMotion");
            isInteracting = enemyAnimatorHandler.anim.GetBool("isInteracting");
            canDoCombo = enemyAnimatorHandler.anim.GetBool("canDoCombo");
            canRotate = enemyAnimatorHandler.anim.GetBool("canRotate");
            enemyAnimatorHandler.anim.SetBool("isDead", enemyStats.isDead);
        }

        private void LateUpdate()
        {
            navmeshAgent.transform.localPosition = Vector3.zero;
            navmeshAgent.transform.localRotation = Quaternion.identity;
        }

        private void HandleStateMachine()
        {
            if (currentState != null)
            {
                State nextState = currentState.Tick(this, enemyStats, enemyAnimatorHandler);

                if (nextState != null)
                {
                    SwitchToNextState(nextState);
                }
            }
        }

        private void SwitchToNextState(State state)
        {
            currentState = state;
        }

        private void HandleRecoveryTimer()
        {
            if (currentRecoveryTime > 0)
            {
                currentRecoveryTime -= Time.deltaTime;
            }

            if (isPerformingAction)
            {
                if (currentRecoveryTime <= 0)
                {
                    isPerformingAction = false;
                }
            }
        }
    }
}
