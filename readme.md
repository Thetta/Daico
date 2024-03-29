# Истории пользователей

## Действующие лица:
1. ВП – владелец проекта. 
2. КИ – Контракт инвесторов.
3. Контракт Daico.

## Позитивный сценарий
1. ВП хочет 1000 токенов и сам публикует контракт Daico. Параметры при публикации следующие:

```cs
var stagesCount = 10;
var stageAmount = 100;
var stageDays = 30;
var daico = await Daico.new(stagesCount, stageAmount, stageDays);
```

2. Далее ВП каким-то (не имеющим значения) образом отправляет КИ адрес своего проекта, и, возможно, дополнительную информацию касательно проекта (описание, документы, прочее).

3. После изучения информации о проекте, и, возможно, переговоров с ВП, инвесторы решают профинансировать проект.

```cs
var amount = await daico.getNeededAmount(); // 1000
await token.approve(daico.address, amount);
await daico.approveTokens();
```

Теперь КИ зафиксирован в контракте проекта и получает некоторые полномочия. Этот адрес нельзя поменять. 

4. Токены за первый период ВП может потратить сразу. Для этого он переводит токены на свой адрес.

```cs
await daico.receiveAmount(stageAmount);
```

5. Проходит месяц. Инвесторы должны проголосовать и решить судьбу проекта. На голосование у КИ есть 3 последние дня текущего проекта. Отсутствие ответа эквивалентно одобрению. В срок от 28 до 30 дня включительно должна быть вызвана функция:

```cs
var decision = 0;
await daico.setInvestorsDecision(decision, {from:investorsContract});
```

Решения могут быть следующими:

```cs
enum Decision {
	OK,
	NoDecision,
	Pause,
	Remove
}
```

6. Голосование повторяется 9 раз, а затем ничего больше не происходит. 


## Негативные сценарии

### NoDecision
### Pause
### Remove
