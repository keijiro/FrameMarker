using UnityEngine;
using System.Collections;

public class Test : MonoBehaviour
{
    public Texture2D[] markerTextures;
    public int markerIndex;

    public GUIStyle labelStyleTop;
    public GUIStyle labelStyleLeft;
    public GUIStyle labelStyleRight;
	
	void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            if (Input.mousePosition.x > Screen.width / 2)
                markerIndex = Mathf.Min(markerIndex + 1, markerTextures.Length - 1);
            else
                markerIndex = Mathf.Max(markerIndex - 1, 0);
        }
        renderer.material.mainTexture = markerTextures[markerIndex];
	}

    void OnGUI()
    {
        var rect = new Rect(0, 0, Screen.width, Screen.height);
        GUI.Label(rect, "Marker No. " + markerIndex, labelStyleTop);
        GUI.Label(rect, "<< --", labelStyleLeft);
        GUI.Label(rect, "++ >> ", labelStyleRight);
    }
}
