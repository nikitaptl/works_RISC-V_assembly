# Потылицин Никита Сергеевич, БПИ228
# Вариант 3
![image](https://github.com/nikitaptl/works_RISC-V_assembly/assets/145208333/1c28dfc2-5e16-4af7-a5d1-0d77d63aac6e)
# #
Работа была выполнена на оценку 10:
  1. Программа разделена на несколько единиц компиляции, где основной файл "main.asm" подключает необходимые макросы из библиотеки макросов с помощью директивы ".include". Подпрограммы ввода-вывода реализованы в виде унифицированных модулей, которые могут использоваться повторно как в основной программе, так и в тестовой. В тестовой программе ввод и вывод могут использоваться неограниченное число раз, в зависимости от количества тестовых кейсов.
  2. Макросы были выделены в отдельную автономную библиотеку, реализованную в папке "macros_library".
  3. Критерии, описанные выше, полностью выполнены.
# #
Критерии для оценки 9:

  1. Добавлены макросы для ввода исходного массива, формирования массива B и вывода массива. Эти макросы могут использоваться повторно в зависимости от значений параметров a0 и a1.
# #
Критерии для оценки 8:
  1. Реализованные макросы универсальны и поддерживают любые наборы исходных данных.
  2. Внедрено автоматическое тестирование с использованием языка программирования Python. Тестовые сценарии описаны в папке "test_cases", и программа на Python в "program_test" использует библиотеку subprocess для запуска RARS, ввода данных и сравнения результатов с ожидаемыми выходными данными.
# #
Требования для оценки 6-7 и ниже:
  1. Все параметры передаваемые в подпрограммы (макросы) отражены на стеке.
  2. Локальные переменные в стеке используются всеми подпрограммами (макросами), и массивы реализованы как последовательные элементы в памяти стека.
  3. Добавлены комментарии во всех местах вызова подпрограмм (макросов), описывающие передачу фактических параметров и перенос возвращаемого результата. Также добавлены комментарии, поясняющие выполненные действия в программе.
  4. Весь информационный материал отражен в отчете.
# Все тесты: #
## Тест1 ##
_input_

![image](https://github.com/nikitaptl/works_RISC-V_assembly/assets/145208333/1f03643c-2784-4d16-bbef-39c9020aff5c)

_output_

![image](https://github.com/nikitaptl/works_RISC-V_assembly/assets/145208333/cc89ccc7-8c31-470d-bb45-29b98ba90333)
## Тест2 ##
_input_                                                                        

![image](https://github.com/nikitaptl/works_RISC-V_assembly/assets/145208333/ec133db2-66d4-41a4-82a6-db02c82cea19)

_output_

![image](https://github.com/nikitaptl/works_RISC-V_assembly/assets/145208333/a1a32f97-92b0-45f1-8afa-3bfabe782746)
## Тест3 ##
_input_                                                                      

![image](https://github.com/nikitaptl/works_RISC-V_assembly/assets/145208333/0f823623-9258-4362-8834-459b12388285)
 
 _output_
 
![image](https://github.com/nikitaptl/works_RISC-V_assembly/assets/145208333/b3e8cc30-b25b-475c-88f8-60d79b2f88a8)

## Тест4 ##
_input_

![image](https://github.com/nikitaptl/works_RISC-V_assembly/assets/145208333/5a5f2983-f41b-47d4-a89a-449ec7ed30b3)

_output_
 
![image](https://github.com/nikitaptl/works_RISC-V_assembly/assets/145208333/b731ea57-d397-4134-90d4-b9d11dcf3491)

## Тест5 ##
_input_

![image](https://github.com/nikitaptl/works_RISC-V_assembly/assets/145208333/0da36c21-11b5-4c3e-acf1-be22534d65db)

_output_
 
![image](https://github.com/nikitaptl/works_RISC-V_assembly/assets/145208333/ea7e5743-d9ad-488e-8bfd-ebcf66921271)

## Тест6 ##
_input_

![image](https://github.com/nikitaptl/works_RISC-V_assembly/assets/145208333/c4290b41-98e4-45e6-9aae-aa8fd1c540e5)

_output_
 
 ![image](https://github.com/nikitaptl/works_RISC-V_assembly/assets/145208333/a26d21cd-3983-49dc-bf05-b2371363c707)
## Тест7 ##
_input_

![image](https://github.com/nikitaptl/works_RISC-V_assembly/assets/145208333/2b7c0536-bfe8-4be2-9274-b00549e53829)

_output_
 
![image](https://github.com/nikitaptl/works_RISC-V_assembly/assets/145208333/38187897-ab10-48b6-ab5e-2a07081a5d6c)
