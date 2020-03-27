#  DateInputTextFormatter

<img src='gif/preview.gif' width='350'>

### Usage

**Add to pub**


    dependencies:
	 date_input_text_formatter: ^0.0.1


**Import**


    import  'package:date_text_input_formatter/date_text_input_formatter.dart';


**Use**


    inputFormatters:  <TextInputFormatter>[
    DateTextInputFormatter(delimiter:  "-", format: [dd, mm, yyyy])
    ],
    
    // dd-mm-yyyy


or


    inputFormatters:  <TextInputFormatter>[
    DateTextInputFormatter( format: [dd, mm, yyyy])
    ],
    
    // dd/mm/yyyy
