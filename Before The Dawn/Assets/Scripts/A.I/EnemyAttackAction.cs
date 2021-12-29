using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    [CreateAssetMenu(menuName = "A.I/Enemy Actions/Attack Action")]
    public class EnemyAttackAction : EnemyAction
    {
        public bool canCombo;

        public EnemyAttackAction comboAction;

        public int attackScore = 3;
        public float recoveryTime = 2f;

        public float maximumAttackAngle = 35f;
        public float minimumAttackAngle = -35f;

        public float minimumDistanceNeededToAttack = 0.1f;
        public float maximumDistanceNeededToAttack = 3f;
    }

}