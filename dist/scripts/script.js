var allAnimations = [
    'circle', 'circle-side', 'arrow-circle',
    'ball-scale', 'ball-circle', 'rectangle',
    'heart', 'ball-rotate', 'ball-pulse',
    'jumping', 'satellite'
];

var animations = [
    'circle', 'circle-side', 'arrow-circle',
    'ball-scale', 'ball-circle', 'rectangle',
    'ball-rotate', 'ball-pulse', 'satellite',
];

var using = 1;

var timer = setInterval(function () {
    changeLoadingAnimation();
}, 2000)

function changeLoadingAnimation() {
    using += 1;
    if (using >= animations.length) using = 0;

    var animator = document.getElementById("loading_animator");
    if (animator != null)
        animator.setAttribute("data-loader", animations[using]);
}

function stopLoadingAnimation() {
    var animator = document.getElementById("loading_animator");
    animator.parentNode.removeChild(animator);
    var tip = document.getElementById("loading_tip");
    tip.parentNode.removeChild(tip);
    clearInterval(timer);
}