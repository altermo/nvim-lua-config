# CR
+ [x] support
+ [x] auto add newline and tab `{|} > CR > {\n\t|\n}`
+ [x] respect the indentation level
+ [x] auto add pair `{| > CR > {\n|\n}`
+ [x] make falback behavior changable
+ [x] auto add multicharacter (markdown code block) `'''text|''' > CR > '''text\n\t|\n'''`)
+ [x] auto add multicharacter pairs `then| > CR > then\n|\nend`
+ [x] autocomplete integration
+ [-] auto add even if text `{abc|} > CR > {abc\n|\n}`
+ [-] dont add multicharacter pairs `then|\nend > CR > then\n|\nend`
+ [-] auto add even if text `(|abc) > CR > (\n|abc\n)`
+ [-] auto add pairs `({| > CR > ({\n|\n})`
+ [-] behave like splitjoin
+ [-] auto add ; att the end of } in c when newline
# BS
+ [x] suport
+ [x] remove the pair `[|] > BS > |`
+ [x] remove the pair when pair filled `[|abc] > BS > |abc`
+ [x] remove the pair when pair empty `()| > BS > |`
+ [x] dont remove pair when cause not balance `[[|] > BS > [|]`
+ [x] make falback behavior changable
+ [x] remove the space in the pair `[ | ] > BS > [|]`
+ [x] remove the pair when multicharacter pair `/*|*/ > BS > |`
+ [-] remove the pair when multicharacter pair empty `/**/| > BS > |`
+ [-] remove the pair when multicharacter pair filled `if bool then |code end > BS > |code`
+ [-] remove the unbalanced space in the pair `[  | ] > BS > [ | ]`
+ [-] remove the unbalanced space in the pair `[ |  ] > BS > [ | ]`
+ [-] remove the unbalanced space in the pair `[  |] > BS > [|]`
+ [-] remove the pair when pair with space `[ ]| > BS > |`
+ [-] remove the space when remove pair `[| text ] > BS > |text`
+ [-] remove the ambiguous pair when filled `"|abc" > BS > |abc`
+ [-] remove the both newline in multiline pair `[\n|\n] > BS > [|]`
# other
+ [x] space `[|] > SP > [ | ]`
+ [x] smart space `[|text] > SP > [ |text ]`
+ [x] norma fastwarp `{}|[] > <A-e> > {[]|}`
+ [ ] norma fastwarp `{}|foo > <A-e> > {foo|}`
+ [ ] norma fastwarp `{foo|},bar > <A-e> > {foo,bar|}`
+ [ ] fastwarp WORD `<A-E>`
+ [ ] fastwarp at `$` `<A-$>`
+ [-] delete mappings
+ [-] norma fastwarp multi line
+ [-] dot repeat?
+ [-] hop style fastwarp
+ [-] `[{"| > <A-k> > [{""}]`
