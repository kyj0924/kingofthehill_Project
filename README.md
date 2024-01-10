# kingofthehill_Project

## 보드게임카페 관리, 운영 및 커뮤니티 웹
프로젝트 기간 : 2023.12.06~2024.01.05  
개발 환경 : Java, Spring framework, AWS RDS(MySQL), MySQL Workbench, HTML, CSS, JavaScript, JQuery, XML, Ajax, BootStrap, GitHub, Eclipse  
개발 인원 : 4명  
본인 역할 : 팀장, webapp/views/select 폴더의 옵션 선택 페이지들, 음식 주문 페이지, 마이페이지, headerMenu.jsp, 로그인 및 회원가입 페이지, 공지사항 게시판 CRUD 등 각 페이지들의 화면 및 기능 구현과 기능적인 오류 발생 시 오류 해결 및 프로젝트 구동 영상을 제작하였습니다.  

## 기획 의도
점주 입장에서는 매장 관리가 편리하고, 유저 입장에서는 보드게임카페 접근성이 증가되는 프로그램을 만들고 싶었습니다.  
또한 기존의 보드게임카페에는 없지만 실제 유저 입장에서 필요하다고 느끼는 기능들을 추가하고 싶었습니다.  

## 프로젝트 목표
오류 없이 동작하는 프로그램을 만든다.  
보드게임카페에서 점주와 유저에게 필요하다고 생각하는 기능들을 최대한 추가한다.  
화면의 각 요소들이 어떤 기능을 하는지 쉽게 파악할 수 있도록 디자인한다.  

## 구동 시 중요!
1. local 버전이기 때문에 src > main > webapp > resources > image 폴더에 있는 사진들을 점포 운영 페이지의 음식 관리, 게임 관리에서 등록해야 화면에서 이미지들을 확인할 수 있습니다.  
2. 음식, 게임 이미지 등록은 음식관리, 게임관리 페이지에서 음식 이름, 게임 이름을 클릭하면 이미지 등록하기 버튼이 있습니다. 처음에는 선택된 파일 없이 등록하여 기본 이미지를 삽입한 후에 이미지를 첨부하여 다시 등록해주시면 됩니다.  
3. DB는 전자정부 프레임워크 4.0.0 환경에서 제공하는 MySQL을 사용하였습니다. db.sql에 있는 테이블 생성 코드와 필수 insert문을 실행 후 구동해야 웹 확인이 가능합니다.  

## 참고사항
1. 실제 프로젝트는 AWS RDS를 사용하여 클라우드 DB로 작동하게 하였으나 public으로 GitHub에 올리다보니 AWS 연결 시 사용한 마스터 암호가 노출될 위험이 있어 전자정부 프레임워크 4.0.0 환경과 로컬 DB에서 작동하도록 변경한 파일을 올렸습니다.  
2. 다운로드의 편의를 위해 Zip 파일을 함께 첨부하였고, 코드 확인을 위해 압축하지 않은 프로젝트 파일도 함께 올려놓았습니다.  
3. 팀 전체 작업을 확인하실 수 있게 팀 프로젝트 ppt를 업로드 해놓았습니다.  
4. Replates는 팀명이며, King Of The Hill은 가상의 보드게임 카페 이름입니다.  
5. 프로젝트 구동 장면을 편하게 확인하실 수 있게 구동 영상을 업로드 해놓았습니다.  
