//vanilla js
// const searchEl = document.querySelector(".search");
// const searchInputEl = document.querySelector("input");
// searchEl.addEventListener("click", function () {
//   searchInputEl.focus();
// });
// searchInputEl.addEventListener("focus", function () {
//   searchInputEl.setAttribute("placeholder", "통합검색");
// });
// searchInputEl.addEventListener("blur", function () {
//   searchInputEl.setAttribute("placeholder", "");
// });

// jquery js
// input과 돋보기 아이콘을 클릭했을 때
$(".search").click(function () {
  $("input").focus();
});
// inputbox 포커스가 될 때
$("input").focus(function () {
  $("input").attr("placeholder", "통합검색");
});
// inputbox 포커스를 잃을 때
$("input").blur(function () {
  $("input").attr("placeholder", "");
});

window.addEventListener(
  "scroll",
  _.throttle(function () {
    // console.log(window.scrollY);
    if (window.scrollY > 500) {
      //  배지 숨기기
      // $(".badges").hide();
      gsap.to("header .badges", 0.3, {
        opacity: 0,
        display: "none",
      });
    } else {
      // 배지 보이기
      // $(".badges").show();
      gsap.to("header .badges", 0.3, {
        opacity: 1,
        display: "block",
      });
    }
  }, 300)
); // 0.3초

//visual 애니메이션
const fadeEls = document.querySelectorAll(".visual .fade-in");
fadeEls.forEach(function (value, index) {
  // console.log("index: " + index, value);
  //gsap.to(요쇼, 지속시간, 옵션)
  gsap.to(value, 1, {
    delay: (index + 1) * 0.7, // 0.7 1.4 2.1 2.8
    opacity: 1,
  });
});

// notice swiper rolling
new Swiper(".notice-line .swiper-container", {
  // Optional parameters
  direction: "vertical",
  // direction: "ho",
  loop: true,
  autoplay: {
    delay: 2000, // 단위는 ms
  },
});

// promotion swiper rolling
new Swiper(".promotion .swiper-container", {
  slidesPerView: 3, // 한번 보여줄 슬라이드 개수
  spaceBetween: 10, // 슬라이드 사이 여백
  centeredSlides: true, // 1번 슬라이드가 중앙으로 보이기
  autoplay: {
    // 자동재생여부
    delay: 5000, // 3초마다 슬라이드 바뀜
  },
  loop: true,
  pagination: {
    el: ".promotion .swiper-pagination", //페이지 번호 요소 선택자
    clickable: true, // 페이지 번호 클릭 제어 기능
  },
  navigation: {
    // 슬라이드 이전/다음 버튼 사용
    prevEl: ".promotion .swiper-prev",
    nextEl: ".promotion .swiper-next",
  },
});

// promotion 슬라이드 토글 기능
// const promotionEl = document.querySelector(".promotion");
// const promotionToggleBtn = document.querySelector(".toggle-promotion");
// let isHidePromotion = false;
// promotionToggleBtn.addEventListener("click", function () {
//   isHidePromotion = !isHidePromotion;

//   if (isHidePromotion) {
//     promotionEl.classList.add("hide");
//   } else {
//     promotionEl.classList.remove("hide");
//   }
// });

// jquery js
let isHidePromotion = false;
$(".toggle-promotion").click(function () {
  isHidePromotion = !isHidePromotion;
  if (isHidePromotion) {
    $(".promotion").attr("class", "promotion hide");
  } else {
    $(".promotion").attr("class", "promotion");
  }
});