using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ST
{
    public class WeaponFX : MonoBehaviour
    {
        [Header("Weapon FX")]
        public ParticleSystem normalWeaponTrail;
        //fire weapon trail
        //light weapon trail
        //dark weapon trail
        //etc

        public void PlayWeaponFX()
        {
            normalWeaponTrail.Stop();

            if (normalWeaponTrail.isStopped)
            {
                normalWeaponTrail.Play();
            }
        }
    }
}
