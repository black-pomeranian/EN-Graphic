using UnityEngine;

public class Rotation : MonoBehaviour
{
    [SerializeField] float yRotation;
    void Update()
    {
        // transform���擾
        Transform myTransform = this.transform;

        // ���[�J�����W��ŁA���݂̉�]�ʂ։��Z����
        myTransform.Rotate(0f, yRotation, 0f);
    }
}