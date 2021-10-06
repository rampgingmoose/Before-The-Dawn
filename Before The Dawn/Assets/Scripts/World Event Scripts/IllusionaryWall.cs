using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    public class IllusionaryWall : MonoBehaviour
    {
        private GameObject go;
        public bool wallHasBeenHit;
        private Material illusionaryWallMaterial;
        public float alpha;
        public float fadeTimer = 2.5f;
        public BoxCollider wallCollider;

        public AudioSource audioSource;
        public AudioClip illusionaryWallSound;

        private void Start()
        {
            go = this.gameObject;
            illusionaryWallMaterial = go.GetComponent<Renderer>().material;
        }

        private void Update()
        {
            if (wallHasBeenHit)
            {
                FadeIllusionaryWall();
            }
        }

        public void FadeIllusionaryWall()
        {
            alpha = illusionaryWallMaterial.GetColor("_BaseColor").a;
            alpha = alpha - Time.deltaTime / fadeTimer;
            Color fadedWallColor = new Color(1, 1, 1, alpha);

            illusionaryWallMaterial.SetColor("_BaseColor", fadedWallColor);

            if (wallCollider.enabled)
            {
                wallCollider.enabled = false;
                audioSource.PlayOneShot(illusionaryWallSound);
            }

            if (alpha <= 0)
            {
                Destroy(this);
            }
        }
    }
}
