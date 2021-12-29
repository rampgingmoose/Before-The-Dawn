using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

namespace ST
{
    public class EnemyManager : CharacterManager
    {
        EnemyAnimatorManager enemyAnimatorHandler;
        EnemyStatsManager enemyStatsManager;
        EnemyFXManager enemyFXManager;
        EnemyLocomotionManager enemyLocomotionManager;

        public State currentState;
        public CharacterStatsManager currentTarget;
        public NavMeshAgent navmeshAgent;
        public Rigidbody enemyRigidBody;

        public bool isPerformingAction;
        public float rotationSpeed = 10;
        public float maximumAggroRadius = 5f;

        [Header("A.I Settings")]
        public float detectionRadius = 20;
        //The higher, and lower, respectively these angles are, the greater detection FIELD OF VIEW (basically like eye sight)
        public float maximumDetectionAngle = 50;
        public float minimumDetectionAngle = -50;
        public float currentRecoveryTime = 0;

        [Header("AI Combat Settings")]
        public bool allowAIToPerformCombos;
        public bool isPhaseShifting;
        public float comboLikelyHood;

        protected override void Awake()
        {
            base.Awake();
            enemyAnimatorHandler = GetComponent<EnemyAnimatorManager>();
            enemyStatsManager = GetComponent<EnemyStatsManager>();
            enemyLocomotionManager = GetComponent<EnemyLocomotionManager>();
            enemyFXManager = GetComponent<EnemyFXManager>();
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

            isUsingLeftHand = enemyAnimatorHandler.animator.GetBool("isUsingLeftHand");
            isUsingRightHand = enemyAnimatorHandler.animator.GetBool("isUsingRightHand");
            isRotatingWithRootMotion = enemyAnimatorHandler.animator.GetBool("isRotatingWithRootMotion");
            isInteracting = enemyAnimatorHandler.animator.GetBool("isInteracting");
            isPhaseShifting = enemyAnimatorHandler.animator.GetBool("isPhaseShifting");
            isInvulnerable = enemyAnimatorHandler.animator.GetBool("isInvulnerable");
            canDoCombo = enemyAnimatorHandler.animator.GetBool("canDoCombo");
            canRotate = enemyAnimatorHandler.animator.GetBool("canRotate");
            enemyAnimatorHandler.animator.SetBool("isDead", enemyStatsManager.isDead);
        }

        protected override void FixedUpdate()
        {
            base.FixedUpdate();
            enemyFXManager.HandleAllBuildUpEffects();
        }

        private void LateUpdate()
        {
            navmeshAgent.transform.localPosition = Vector3.zero;
            navmeshAgent.transform.localRotation = Quaternion.identity;
        }

        private void HandleStateMachine()
        {
            if (enemyStatsManager.isDead)
            {
                currentState = null;
            }
            else if (currentState != null)
            {
                State nextState = currentState.Tick(this, enemyStatsManager, enemyAnimatorHandler);

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
