--�r���[�Ɠ����\���̃e�[�u�����쐬����SQL�B
--�J�����E�e�X�g���ɁA���G�ȃr���[���ƃf�[�^��p�ӂ���̂�����Ȃ��߁A
--�����̃e�[�u�����쐬����ƊȈՂɂȂ�B

--�y�r���[����TEMP�p�e�[�u���쐬�i�e�[�u���ƃf�[�^�����쐬�j�z
select * into [dbo].[V_PRODUCT_MST] FROM [dbo].[V_PRODUCT_MST_TMP_TBL];

--�y�r���[���e�[�u���ϊ��z
sp_rename 'dbo.V_PRODUCT_MST' , 'V_PRODUCT_MST_TMP_VIEW';
sp_rename 'dbo.V_PRODUCT_MST_TMP_TBL' , 'V_PRODUCT_MST';

--�y�e�[�u�����r���[�ϊ��z
sp_rename 'dbo.V_PRODUCT_MST' , 'V_PRODUCT_MST_TMP_TBL';
sp_rename 'dbo.V_PRODUCT_MST_TMP_VIEW' , 'V_PRODUCT_MST';

--�yTEMP�p�e�[�u���폜�z
drop table [dbo].[V_PRODUCT_MST_TMP_TBL];
