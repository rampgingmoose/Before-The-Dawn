using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    public class EnemyLocomotionManager : MonoBehaviour
    {
        EnemyManager enemyManager;
        EnemyAnimatorManager enemyAnimatorManager;
        
        public Rigidbody rigidBody;
        public Vector3 moveDirection;

        [HideInInspector]
        public Transform enemyTransform;

        [Header("Ground & Air Detection Stats")]
        [SerializeField]
        float groundDetectionRayStartPoint = 0.5f;
        [SerializeField]
        float minimumDistanceNeededToBeginFall = 1f;
        [SerializeField]
        float groundDirectionRayDistance = 0.2f;
        LayerMask ignoreForGroundCheck;
        public float inAirTimer;

        [Header("Movement Stats")]
        [SerializeField]
        float movementSpeed = 5;
        [SerializeField]
        float fallingSpeed = 45;

        private void Awake()
        {
            enemyManager = GetComponent<EnemyManager>();
            enemyAnimatorManager = GetComponentInChildren<EnemyAnimatorManager>();
        }

        #region Falling

        public void HandleFalling(float delta, Vector3 moveDirection)
        {
            Vector3 normalVector;
            Vector3 enemyTargetPosition;

            enemyManager.isGrounded = false;
            RaycastHit hit;
            Vector3 origin = enemyTransform.position;
            origin.y += groundDetectionRayStartPoint;

            if (Physics.Raycast(origin, enemyTransform.forward, out hit, 0.4f))
            {
                moveDirection = Vector3.zero;
            }

            if (enemyManager.isInAir)
            {
                rigidBody.AddForce(-Vector3.up * fallingSpeed);
                rigidBody.AddForce(moveDirection * fallingSpeed / 10f);
            }

            Vector3 dir = moveDirection;
            dir.Normalize();
            origin = origin + dir * groundDirectionRayDistance;

            enemyTargetPosition = enemyTransform.position;

            Debug.DrawRay(origin, -Vector3.up * minimumDistanceNeededToBeginFall, Color.red, 0.1f, false);
            if (Physics.Raycast(origin, -Vector3.up, out hit, minimumDistanceNeededToBeginFall, ignoreForGroundCheck))
            {
                normalVector = hit.normal;
                Vector3 tp = hit.point;
                enemyManager.isGrounded = true;
                enemyTargetPosition.y = tp.y;

                if (enemyManager.isInAir)
                {
                    if (inAirTimer > 0.5f)
                    {
                        Debug.Log("You were in the air for " + inAirTimer);
                        enemyAnimatorManager.PlayTargetAnimation("Land", true);
                        inAirTimer = 0;
                    }
                    else
                    {
                        enemyAnimatorManager.PlayTargetAnimation("Empty", false);
                        inAirTimer = 0;
                    }

                    enemyManager.isInAir = false;
                }
            }
            else
            {
                if (enemyManager.isGrounded)
                {
                    enemyManager.isGrounded = false;
                }

                if (enemyManager.isInAir == false)
                {
                    if (enemyManager.isInteracting == false)
                    {
                        enemyAnimatorManager.PlayTargetAnimation("Falling", true);
                    }

                    Vector3 vel = rigidBody.velocity;
                    vel.Normalize();
                    rigidBody.velocity = vel * (movementSpeed / 2);
                    enemyManager.isInAir = true;
                }
            }

            if (enemyManager.isInteracting)
            {
                enemyTransform.position = Vector3.Lerp(enemyTransform.position, enemyTargetPosition, Time.deltaTime / 0.1f);
            }
            else
            {
                enemyTransform.position = enemyTargetPosition;
            }

            if (enemyManager.isGrounded)
            {
                if (enemyManager.isGrounded)
                {
                    enemyTransform.position = Vector3.Lerp(enemyTransform.position, enemyTargetPosition, Time.deltaTime);
                }
                else
                {
                    enemyTransform.position = enemyTargetPosition;
                }
            }
        }
        #endregion
    }
}
