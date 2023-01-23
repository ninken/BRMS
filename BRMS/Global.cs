namespace BRMS
{
    public static class Business
    {
        public static int vRuleGroupId = 0;
        public static int vRuleId = 0;
        public static string vRuleExpression;
        public static string vRuleSetCommand;
        public static string vDBTable;
        public static string vTableName;
        public static string vTableKey;
        public static string vDBView;
        public static string vViewName;
        public static string vViewKey;
        public static string vSQLPreview;
    }

    public static class StringExt
    {
        public static string Truncate(this string value, int maxLength)
        {
            if (!string.IsNullOrEmpty(value) && value.Length > maxLength)
            {
                return value.Substring(0, maxLength);
            }
            return value;
        }
    }
}


