/// アプリ全体で使用するルートパス定数
///
/// Domain層がRouter層に直接依存しないよう、パス文字列をApp Config層に定義する。
/// Router Enumはこのファイルの定数を参照し、重複定義を防ぐ。

// Shopping
const String kShoppingListPath = '/play/shopping';
const String kShoppingWaterPath = '/play/shopping/water';
const String kShoppingCartPath = '/play/shopping/cart';
const String kShoppingCheckoutPath = '/play/shopping/checkout';
const String kShoppingReorderPath = '/play/shopping/reorder';

// Chat
const String kChatListPath = '/play/chat';
const String kChatQuiz1Path = '/play/chat/quiz1';
const String kChatQuiz2Path = '/play/chat/quiz2';
const String kChatQuiz3Path = '/play/chat/quiz3';
const String kChatQuiz4Path = '/play/chat/quiz4';

// Streaming
const String kStreamingListPath = '/play/streaming';
const String kStreamingQuiz1Path = '/play/streaming/quiz1';
const String kStreamingQuiz2Path = '/play/streaming/quiz2';
const String kStreamingQuiz3Path = '/play/streaming/quiz3';
const String kStreamingQuiz4Path = '/play/streaming/quiz4';

// Map
const String kMapListPath = '/play/map';
const String kMapQuiz1Path = '/play/map/quiz1';
const String kMapQuiz2Path = '/play/map/quiz2';
const String kMapQuiz3Path = '/play/map/quiz3';
const String kMapQuiz4Path = '/play/map/quiz4';

// Alarm
const String kAlarmListPath = '/play/alarm';
const String kAlarmQuiz1Path = '/play/alarm/quiz1';
const String kAlarmQuiz2Path = '/play/alarm/quiz2';
const String kAlarmQuiz3Path = '/play/alarm/quiz3';
const String kAlarmQuiz4Path = '/play/alarm/quiz4';

// Payment
const String kPaymentListPath = '/play/payment';
const String kPaymentQuiz1Path = '/play/payment/quiz1';
const String kPaymentQuiz2Path = '/play/payment/quiz2';
const String kPaymentQuiz3Path = '/play/payment/quiz3';
const String kPaymentQuiz4Path = '/play/payment/quiz4';

// Mail
const String kMailListPath = '/play/mail';
const String kMailQuiz1Path = '/play/mail/quiz1';
const String kMailQuiz2Path = '/play/mail/quiz2';
const String kMailQuiz3Path = '/play/mail/quiz3';
const String kMailQuiz4Path = '/play/mail/quiz4';

// Todo
const String kTodoSegment = 'todo';
const String kTodoQuiz1Segment = 'quiz1';
const String kTodoQuiz2Segment = 'quiz2';
const String kTodoQuiz3Segment = 'quiz3';
const String kTodoQuiz4Segment = 'quiz4';
const String kTodoListPath = '/play/$kTodoSegment';
const String kTodoQuiz1Path = '$kTodoListPath/$kTodoQuiz1Segment';
const String kTodoQuiz2Path = '$kTodoListPath/$kTodoQuiz2Segment';
const String kTodoQuiz3Path = '$kTodoListPath/$kTodoQuiz3Segment';
const String kTodoQuiz4Path = '$kTodoListPath/$kTodoQuiz4Segment';

// News
const String kNewsSegment = 'news';
const String kNewsQuiz1Segment = 'quiz1';
const String kNewsQuiz2Segment = 'quiz2';
const String kNewsQuiz3Segment = 'quiz3';
const String kNewsQuiz4Segment = 'quiz4';
const String kNewsListPath = '/play/$kNewsSegment';
const String kNewsQuiz1Path = '$kNewsListPath/$kNewsQuiz1Segment';
const String kNewsQuiz2Path = '$kNewsListPath/$kNewsQuiz2Segment';
const String kNewsQuiz3Path = '$kNewsListPath/$kNewsQuiz3Segment';
const String kNewsQuiz4Path = '$kNewsListPath/$kNewsQuiz4Segment';

// Calendar
const String kCalendarListPath = '/play/calendar';
const String kCalendarQuiz1Path = '/play/calendar/quiz1';
const String kCalendarQuiz2Path = '/play/calendar/quiz2';
const String kCalendarQuiz3Path = '/play/calendar/quiz3';
const String kCalendarQuiz4Path = '/play/calendar/quiz4';

// SNS
const String kSnsListPath = '/play/sns';
const String kSnsQuiz1Path = '/play/sns/quiz1';
const String kSnsQuiz2Path = '/play/sns/quiz2';
const String kSnsQuiz3Path = '/play/sns/quiz3';
const String kSnsQuiz4Path = '/play/sns/quiz4';

// Matching
const String kMatchingSegment = 'matching';
const String kMatchingQuiz1Segment = 'quiz1';
const String kMatchingQuiz2Segment = 'quiz2';
const String kMatchingQuiz3Segment = 'quiz3';
const String kMatchingQuiz4Segment = 'quiz4';
const String kMatchingListPath = '/play/$kMatchingSegment';
const String kMatchingQuiz1Path = '$kMatchingListPath/$kMatchingQuiz1Segment';
const String kMatchingQuiz2Path = '$kMatchingListPath/$kMatchingQuiz2Segment';
const String kMatchingQuiz3Path = '$kMatchingListPath/$kMatchingQuiz3Segment';
const String kMatchingQuiz4Path = '$kMatchingListPath/$kMatchingQuiz4Segment';

// Comic
const String kComicSegment = 'comic';
const String kComicQuiz1Segment = 'quiz1';
const String kComicQuiz2Segment = 'quiz2';
const String kComicQuiz3Segment = 'quiz3';
const String kComicQuiz4Segment = 'quiz4';
const String kComicListPath = '/play/$kComicSegment';
const String kComicQuiz1Path = '$kComicListPath/$kComicQuiz1Segment';
const String kComicQuiz2Path = '$kComicListPath/$kComicQuiz2Segment';
const String kComicQuiz3Path = '$kComicListPath/$kComicQuiz3Segment';
const String kComicQuiz4Path = '$kComicListPath/$kComicQuiz4Segment';
