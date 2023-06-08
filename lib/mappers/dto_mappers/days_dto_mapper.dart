import 'package:mind_app/model/day.dart';
import 'package:mind_app/model/day_list.dart';
import 'package:mind_app/model/day_result.dart';
import 'package:mind_app/services/dto/days_dto.dart';
import 'package:pine/pine.dart';



class DaysListMapper extends DTOMapper<DaysDTO, DaysList> {
  @override
  DaysList fromDTO(DaysDTO dto) {
    List<Day> days = [];
    if(dto.days != null){
      DayMapper dayMapper = DayMapper();
      dto.days!.forEach((element) { days.add(dayMapper.fromDTO(element));});
    }
    return DaysList(count: dto.count!);
  }

  @override
  DaysDTO toDTO(DaysList model) { 
    return DaysDTO(
   
    );
  }
}

class DayResultMapper extends DTOMapper<DayResultDTO, DayResult> {
  @override
  DayResult fromDTO(DayResultDTO dto) {
    Day? day;
    if(dto.dayDTO != null){
      DayMapper dayMapper = DayMapper();
      day = dayMapper.fromDTO(dto.dayDTO!);
    }
    return DayResult(day: day);
  }

  @override
  DayResultDTO toDTO(DayResult model) { 
    DayMapper dayMapper = DayMapper();
    return DayResultDTO(
      dayDTO: dayMapper.toDTO(model.day!)
    );
  }
}

class DayMapper extends DTOMapper<DayDTO, Day> {
  @override
  Day fromDTO(DayDTO dto) => Day(mood: dto.mood!, day: dto.day!, note: dto.note!, tags: dto.tags!);

  @override
  DayDTO toDTO(Day model) { 
    return DayDTO(
      mood: model.mood,
      day: model.day,
      note: model.note,
      tags: model.tags
    );
  }
}
