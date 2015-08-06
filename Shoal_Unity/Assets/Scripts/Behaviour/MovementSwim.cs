using UnityEngine;
using System.Collections;

public class MovementSwim : Movement
{
    [SerializeField] private BetweenFloat turnSpeed;
    [SerializeField] private BetweenFloat pushTime;
    [SerializeField] private BetweenFloat pushForce;
    [SerializeField] private AnimationCurve[] motionStrengthCurve;

    private float currentTurnDelta;
    private float currentPushForce;
    private AnimationCurve currentCurve;
    private Countdown nextChangeCountdown;

    protected override void Awake()
    {
        base.Awake();

        nextChangeCountdown = new Countdown(0);

        ChooseTurnDelta();
    }

    private void ChooseTurnDelta()
    {
        nextChangeCountdown.Reset(pushTime.Random);
        currentTurnDelta = MathUtil.RandomSign * turnSpeed.Random;
        currentPushForce = pushForce.Random;
        currentCurve = motionStrengthCurve.RandomElement();
    }

    protected override void Update()
    {
        base.Update();
        if (nextChangeCountdown.Update())
        {
            ChooseTurnDelta();
        }
    }

    protected override Vector2 CalculateForce()
    {
        var percent = currentCurve.Evaluate(nextChangeCountdown.Percent);

        var currentAngleRad = vehicle.HeadingAngleRad;

        currentAngleRad += currentTurnDelta * percent * Time.deltaTime;

        return UnityHelper.CreateVector2AngleRad(currentAngleRad) * currentPushForce * percent;
    }
}
