--ビューと同じ構成のテーブルを作成するSQL。
--開発時・テスト時に、複雑なビューだとデータを用意するのが困難なため、
--同名のテーブルを作成すると簡易になる。

--【ビューからTEMP用テーブル作成（テーブルとデータ同時作成）】
select * into [dbo].[V_PRODUCT_MST] FROM [dbo].[V_PRODUCT_MST_TMP_TBL];

--【ビュー→テーブル変換】
sp_rename 'dbo.V_PRODUCT_MST' , 'V_PRODUCT_MST_TMP_VIEW';
sp_rename 'dbo.V_PRODUCT_MST_TMP_TBL' , 'V_PRODUCT_MST';

--【テーブル→ビュー変換】
sp_rename 'dbo.V_PRODUCT_MST' , 'V_PRODUCT_MST_TMP_TBL';
sp_rename 'dbo.V_PRODUCT_MST_TMP_VIEW' , 'V_PRODUCT_MST';

--【TEMP用テーブル削除】
drop table [dbo].[V_PRODUCT_MST_TMP_TBL];
