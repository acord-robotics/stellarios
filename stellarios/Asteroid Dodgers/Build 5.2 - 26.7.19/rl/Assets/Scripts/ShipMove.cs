using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ShipMove : MonoBehaviour
{
    public Text ScoreText;
    public Text WinText;
    public Text HullText;

    private Rigidbody rb;
    private int score;
    private int hull;

    private void Start()
    {
        rb = GetComponent<Rigidbody>();
        score = 0;
        SetScoreText();
        WinText.text = "";
        hull = 10;
        SetHullText();
    }

    void FixedUpdate()
    {
        float h = Input.GetAxis("Horizontal") * 5;
        float v = Input.GetAxis("Vertical") * 5;

        Vector3 vel = rb.velocity;

        vel.x = h;
        vel.z = v;
        rb.velocity = vel;

    }

    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Pick Up"))
        {
            other.gameObject.SetActive(false);
            score = score + 1;
            SetScoreText();
        }

        if (other.gameObject.CompareTag("Asteroid"))
        {
            other.gameObject.SetActive(false);
            hull = hull - 1;
            SetHullText();
        }

        if (other.gameObject.CompareTag("BigAsteroid"))
        {
            other.gameObject.SetActive(false);
            hull = hull - 2;
            SetHullText();
        }
    }

    void SetScoreText ()
    {
        ScoreText.text = "Score: " +
            score.ToString();
                if (score >=5)
        {
            WinText.text = "You Win!";
            Application.LoadLevel("Level2Home");
        }
    }
    void SetHullText ()
    {
        HullText.text = "Strength: " +
            hull.ToString();
                if (hull <=0)
        {
            WinText.text = "You Crashed!";
            Application.LoadLevel("MainMenu");
        }
    }
}