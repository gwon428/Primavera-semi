  const navIcons = document.querySelectorAll("i");
 	const aList = document.querySelectorAll(".image-content");

      navIcons[0].addEventListener("click", function () {
        aList.forEach((a) => {
          img.classList.remove("header-main-bottom-right");
        });
      });
      navIcons[1].addEventListener("click", function () {
        aList.forEach((a) => {
          img.classList.add("header-main-bottom-right");
        });
      });