using UnityEngine;

public class Rotation : MonoBehaviour
{
    [SerializeField] float yRotation;
    void Update()
    {
        // transformを取得
        Transform myTransform = this.transform;

        // ローカル座標基準で、現在の回転量へ加算する
        myTransform.Rotate(0f, yRotation, 0f);
    }
}