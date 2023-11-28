   -- 수정쿼리
   
		UPDATE
		        BOARD
		    SET BOARD_TITLE = '수정쿼리문 테스트중'
		        , BOARD_COMMENT = '오예'
		        , MODIFIED_TIME = TO_CHAR(SYSDATE)
		WHERE BOARD_NUM = 0
        AND BOARD_TYPE = 1
        ;


-- 조회
      SELECT 
		  BOARD_TYPE
		  ,BOARD_NUM
		  ,BOARD_TITLE
		  ,BOARD_COMMENT
		  ,TOTAL_CNT
		FROM 
		(
		  SELECT
		      	BOARD_TYPE
				,BOARD_NUM
				,BOARD_TITLE
				,BOARD_COMMENT
		      	,ROW_NUMBER() OVER(ORDER BY BOARD_NUM DESC) AS NUMROW
		      	,COUNT(*) OVER() AS TOTAL_CNT
			FROM
				BOARD	
		)
	;
    
    -- 삭제
    DELETE
    FROM BOARD
    WHERE BOARD_NUM = 5
    AND BOARD_TYPE = 1
    ;
    
    
      INSERT INTO 
        BOARD
        (BOARD_TYPE
        ,BOARD_NUM
        ,BOARD_TITLE
        ,BOARD_COMMENT
        ,CREATOR
        ,CREATE_TIME
        ,MODIFIER
        ,MODIFIED_TIME
        )
        VALUES
        ('1'
        ,( SELECT NVL(TO_NUMBER(MAX(BOARD_NUM)+1),1)
		FROM BOARD
		WHERE BOARD_TYPE = '1')
        ,'왜안되누'
        ,'뭐가문제구'
        ,'SYSTEM'
        ,TO_CHAR(SYSDATE)
        ,'SYSTEM'
        ,TO_CHAR(SYSDATE)
        )
        ;
        
        delete
        from board;
        
        commit;
        
        
        
        
        
        
        SELECT TO_NUMBER(MAX(NVL (BOARD_NUM,1))+1)
		FROM BOARD
		WHERE BOARD_TYPE = '1'
        ;
        
        SELECT NVL(TO_NUMBER(MAX(BOARD_NUM)+1),1)
		FROM BOARD
		WHERE BOARD_TYPE = '1'
        ;
        
        
        -- 회원 강제 삽입
        
        INSERT INTO
		USER_INFO
		(USER_ID
		,USER_PW
		,USER_NAME
		,USER_PHONE1
		,USER_PHONE2
		,USER_PHONE3
		,USER_ADDR1
		,USER_ADDR2
		,USER_COMPANY
		,CREATOR
		,CREATE_TIME
		,MODIFIER
		,MODIFIED_TIME
		)
		VALUES
		(
		'admin'
        ,'asdfqwer'
        ,'관리자'
		,'010'
        ,'1111'
        ,'2222'
        ,'123-123'
        ,'아오 삽입힘들어'
        ,'천상계'
		,'SYSTEM'
		,TO_CHAR(SYSDATE)
		,'SYSTEM'
		,TO_CHAR(SYSDATE)
		)
        ;
        
                INSERT INTO
		USER_INFO
		(USER_ID
		,USER_PW
		,USER_NAME
		,USER_PHONE1
		,USER_PHONE2
		,USER_PHONE3
		,USER_ADDR1
		,USER_ADDR2
		,USER_COMPANY
		,CREATOR
		,CREATE_TIME
		,MODIFIER
		,MODIFIED_TIME
		)
		VALUES
		(
		'apple'
        ,'asdfqwer'
        ,'사과농부'
		,'011'
        ,'3333'
        ,'4444'
        ,'3333-123'
        ,'아오 삽입힘들어'
        ,'천상계'
		,'SYSTEM'
		,TO_CHAR(SYSDATE)
		,'SYSTEM'
		,TO_CHAR(SYSDATE)
		)
        ;
        
        
        -- 아이디 중복 조회
        SELECT COUNT(*)
        FROM USER_INFO
        WHERE USER_ID = 'admin'
        and user_PW = 'asdfqwer'
        ;
        
        -- 회원 전체 조회
        SELECT
        USER_ID
		,USER_PW
		,USER_NAME
		,USER_PHONE1
		,USER_PHONE2
		,USER_PHONE3
		,USER_ADDR1
		,USER_ADDR2
		,USER_COMPANY
        FROM USER_INFO
        ;
        
        
        
        -- 회원 삽입 쿼리
        
         INSERT INTO
		USER_INFO
		(USER_ID
		,USER_PW
		,USER_NAME
		,USER_PHONE1
		,USER_PHONE2
		,USER_PHONE3
		,USER_ADDR1
		,USER_ADDR2
		,USER_COMPANY
		,CREATOR
		,CREATE_TIME
		,MODIFIER
		,MODIFIED_TIME
		)
		VALUES
		(
		'admin'
        ,'asdfqwer'
        ,'관리자'
		,'010'
        ,'1111'
        ,'2222'
        ,'123-123'
        ,'아오 삽입힘들어'
        ,'천상계'
		,'SYSTEM'
		,TO_CHAR(SYSDATE)
		,'SYSTEM'
		,TO_CHAR(SYSDATE)
		)
        ;
        
        
        
   -- 폰 앞번호 검색 쿼리
   
   select DISTINCT user_phone1
   from user_info
   ;
        
    -- 타입 중복 제거
    select distinct board_type
    from board
    ;
        
    -- 글 작성자까지 조회하는 게시글
    SELECT
		BOARD_TYPE
		,BOARD_NUM
		,BOARD_TITLE
		,BOARD_COMMENT
        ,creator
		FROM
		BOARD
		WHERE
		BOARD_TYPE = 1
        ;
       
       
       -- com code 테이블 - 게시글ㄹ타입 조회
       
       select 
       code_id
       
       ,code_name
       from com_code
       where code_type = 'menu'
       ;
       
             -- com code 테이블 - 폰번호 조회
       
       select 
       code_id
       
       ,code_name
       from com_code
       where code_type = 'phone'
       ;
       
     
     -- 게시판 조회 + com 테이블 합치기
     
     SELECT
		BOARD_TYPE
        ,CODE_NAME
		,BOARD_NUM
		,BOARD_TITLE
		,BOARD_COMMENT
		,TOTAL_CNT
		FROM
		(
		SELECT
		BOARD_TYPE
		,BOARD_NUM
		,BOARD_TITLE
		,BOARD_COMMENT
		,ROW_NUMBER()
		OVER(ORDER BY
		BOARD_NUM DESC) AS NUMROW
		,COUNT(*) OVER() AS TOTAL_CNT
		FROM
		BOARD
		)
        JOIN COM_CODE on (BOARD_TYPE = CODE_ID)
        ;
        
        
        
        SELECT NVL(TO_NUMBER(MAX(BOARD_NUM)+1),1)
		FROM BOARD
		;
        
        
        -- 게시판 상세 조회
        
		 SELECT
		BOARD_TYPE
		,BOARD_NUM
		,BOARD_TITLE
		,BOARD_COMMENT
		,TOTAL_CNT
		,CREATOR
		FROM
		(
		SELECT
		BOARD_TYPE
		,BOARD_NUM
		,BOARD_TITLE
		,BOARD_COMMENT
		,ROW_NUMBER()
		OVER(ORDER BY
		BOARD_NUM DESC) AS NUMROW
		,COUNT(*) OVER() AS TOTAL_CNT
        ,creator
		FROM
		BOARD
		)
        ;
        
        
        -- 왜 a01만 검색이 안될까?
        SELECT
		BOARD_TYPE
		,BOARD_NUM
		,BOARD_TITLE
		,BOARD_COMMENT
		,TOTAL_CNT
		,CREATOR
		FROM
		(
		SELECT
		BOARD_TYPE
		,BOARD_NUM
		,BOARD_TITLE
		,BOARD_COMMENT
		,ROW_NUMBER()
		OVER(ORDER BY
		BOARD_NUM DESC) AS NUMROW
		,COUNT(*) OVER() AS
		TOTAL_CNT
		,CREATOR
		FROM
		BOARD
        where BOARD_TYPE in ('a01')
		)
		WHERE
		NUMROW BETWEEN (2-1)* 5 + 1
		AND
		(2)*5

            ;
        
        select *
        from board
        where board_type = 'a01'
        ;
        
        SELECT
		BOARD_TYPE
		,BOARD_NUM
		,BOARD_TITLE
		,BOARD_COMMENT
		,CREATOR
		FROM
         board
        where board_type = 'a03'
        ;