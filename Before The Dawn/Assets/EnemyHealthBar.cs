using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace ST
{
    public class EnemyHealthBar : MonoBehaviour
    {
        public Slider slider;

        public Color enemyHealthBarColor;

        public Vector3 offset;

        private void Update()
        {
            slider.transform.position = transform.parent.position + offset;
            transform.rotation = Camera.main.transform.rotation;
        }

        public void SetMaxHealth(int maxHealth)
        {
            slider.maxValue = maxHealth;
            slider.value = maxHealth;
        }

        public void SetCurrentHealth(int currentHealth)
        {
            slider.value = currentHealth;
        }
    }
}

