function validate() {
						let f = document.update;

						if (f.postCode.value == '') {
							f.postCode.focus();
							alert("우편 번호를 입력해주세요");
							return false;
						} else if (f.roadAddress.value == '') {
							f.roadAddress.focus();
							alert("주소를 입력해주세요");
							return false;
						} else if (f.detailAddress.value == '') {
							f.detailAddress.focus();
							alert("상세 주소를 입력해주세요");
							return false;
						} else if (f.collectionDate.value == '') {
							alert("수거일을 입력해주세요");
							return false;
						} else if (f.kg.value == '') {
							f.kg.focus();
							alert("수거 신청 무게를 입력해주세요");
							return false;
						} alert("신청 정보 수정 성공하였습니다.");
						return true;
					}

					$(function () {

						$("#collectionDate").datepicker({
							dateFormat: 'yy-mm-dd',
							minDate: 0 + "2D",
							maxDate: new Date('2025-12-31'),
							changeMonth: true,
							changeYear: true,
							nextText: '다음 달',
							prevText: '이전 달'
						});

					});