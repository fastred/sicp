A history of deductions (applications) should contain rules' conclusions and
frames with bindings, for example evaluation of an application:
(outranked-by (Bitdiddle Ben) ?who)
should add to the history an entry:
((outranked-by ?staff-person ?boss) frame)

To check whether we should proceed with an application we iterate through
the history and check if a given entry matches current application. They
match if they obey these two conditions:
1) conclusions are the same,
2) bindings of variables existing in a conclusion pattern are the same.
If we find such an entry we cancel this application and return an empty stream as
a result.

So if we continued to evaluate outranked-by rule we'd find that the next application is:
(outranked-by ?middle-manager ?who)
We match it against a history. Value of the first variable here, '?middle-manager',
is different then the one found in the only entry in the history: '(Bitdiddle Ben)'.
Match isn't found so we evaluate this application and add:
((outranked-by ?staff-person ?boss) new-frame)
to the history.

Next application that we encounter is a:
(outranked-by ?middle-manager ?who)
This time we match it with one of the entries in our history (the newest one).
We cancel this application and return an empty stream of results.

Note: to keep it simple in this example I didn't consider applications of 'supervisor' rule.
