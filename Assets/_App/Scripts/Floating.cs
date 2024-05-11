using System.Collections;
using System.Collections.Generic;
using UnityEngine;

  public class Floating : MonoBehaviour
{

    [SerializeField] float speed;
   float nowPosi;

    void Start()
    {
        nowPosi = this.transform.position.y;
    }

    void Update()
    {
        transform.position = new Vector3(transform.position.x, nowPosi + Mathf.PingPong(Time.time*speed, 0.2f), transform.position.z);
    }

}