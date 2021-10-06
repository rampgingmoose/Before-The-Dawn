using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace ST
{
    public class EnemyHealthBar : MonoBehaviour
    {
        public Slider slider;
        float timeUntilBarIsHidden = 3f;

        public Color enemyHealthBarColor;

        public Vector3 offset;

        private void Awake()
        {
            slider.gameObject.SetActive(false);
        }

        private void Update()
        {
            slider.transform.position = transform.parent.position + offset;
            transform.rotation = Camera.main.transform.rotation;
            HideHealthBarTimer();
        }

        private void HideHealthBarTimer()
        {
            timeUntilBarIsHidden = timeUntilBarIsHidden - Time.deltaTime;

            if (timeUntilBarIsHidden <= 0)
            {
                timeUntilBarIsHidden = 0;
                slider.gameObject.SetActive(false);
            }
            else
            {
                if (!slider.gameObject.activeInHierarchy)
                {
                    slider.gameObject.SetActive(true);
                }
            }

            if (slider.value <= 0)
            {
                slider.gameObject.SetActive(false);
            }
        }
        public void SetMaxHealth(int maxHealth)
        {
            slider.maxValue = maxHealth;
            slider.value = maxHealth;
        }

        public void SetCurrentHealth(int currentHealth)
        {
            slider.value = currentHealth;
            timeUntilBarIsHidden = 3f;
        }
    }
}

