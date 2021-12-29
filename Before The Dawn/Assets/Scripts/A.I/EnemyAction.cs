using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    public class EnemyAction : ScriptableObject
    {
        public string actionAnimation;
        public bool isRightHandedAction = true;
        public bool isLeftHandedAction = false;

        public void DecideHandAction()
        {
            if (isRightHandedAction != true)
            {
                isLeftHandedAction = true;
            }
        }
    }
}
