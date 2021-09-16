using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    public class WorldEventManager : MonoBehaviour
    {
        public List<FogWall> fogWalls;
        UIBossHealthBar bossHealthBar;
        EnemyBossManager boss;

        public bool bossFightIsActive; //Is currently fighting boss
        public bool bossHasBeenAwakened; //Woke the boss/activated cutscene but probably died during fight
        public bool bossHasBeenDefeated; //Boss has been defeated

        private void Awake()
        {
            bossHealthBar = FindObjectOfType<UIBossHealthBar>();
        }

        public void ActivateBossFight()
        {
            bossFightIsActive = true;
            bossHasBeenAwakened = true;
            bossHealthBar.SetUIHealthBarToActive();
            
            foreach (var fogWall in fogWalls)
            {
                fogWall.ActivateFogWall();
            }
        }

        public void BossHasBeenDefeated()
        {
            bossFightIsActive = false;
            bossHasBeenDefeated = true;
            bossHealthBar.SetHealthBarToInactive();

            foreach (var fogWall in fogWalls)
            {
                fogWall.DeactivateFogWall();
            }
        }
    }
}
