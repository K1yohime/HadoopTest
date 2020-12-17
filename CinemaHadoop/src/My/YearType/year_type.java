package My.YearType;

import java.io.IOException;
import java.text.DecimalFormat;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;

public class year_type {

	public static class Map extends Mapper<Object, Text, Text, DoubleWritable> {

		private static Text newKey = new Text();
		private static DoubleWritable newValue = new DoubleWritable();

		public void map(Object key, Text value, Context context)
				throws IOException, InterruptedException {
			System.out.println("class start!");

			String line = value.toString();
			String film[] = line.split("\t");

			String fyear = film[1];
			String score = film[5];
			String ft0 = film[4].replace("[", "");
			String ft1 = ft0.replace("]", "");
			String ft2 = ft1.replace(" ", "");
			String ftype[] = ft2.split(",");

			if (isNumeric(film[1]) && isNumeric(film[5]) && isNumeric(film[6])
					&& isNumeric(film[7]) && isNumeric(film[8])) {
				for (int i = 0; i < ftype.length; i++) {
					String thekey = fyear + "\t" + ftype[i];
					newKey.set(thekey);

					System.out.println(thekey);

					newValue.set(Double.parseDouble(score));
					context.write(newKey, newValue);
				}
			}
		}
	}

	public static class Reduce extends
			Reducer<Text, DoubleWritable, Text, DoubleWritable> {

		public void reduce(Text key, Iterable<DoubleWritable> values,
				Context context) throws IOException, InterruptedException {

			System.out.println("reduce start!");

			double num = 0;
			int count = 0;

			for (DoubleWritable val : values) {
				num += val.get();
				count++;
			}
			double avg = num / count;

			DecimalFormat df = new DecimalFormat("0.0");
			String result = df.format(avg);

			context.write(key, new DoubleWritable(Double.parseDouble(result)));
		}
	}

	public static void main(String[] args) throws IOException,
			ClassNotFoundException, InterruptedException {
		Configuration conf = new Configuration();

		Job job = new Job(conf, "YearType");
		job.setJarByClass(year_type.class);

		job.setMapperClass(Map.class);
		job.setReducerClass(Reduce.class);

		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(DoubleWritable.class);

		job.setInputFormatClass(TextInputFormat.class);
		job.setOutputFormatClass(TextOutputFormat.class);

		Path in = new Path("hdfs://localhost:9000/filmdata/in/pa3.txt");
		Path out = new Path("hdfs://localhost:9000/yeartpe/out6");
		FileInputFormat.addInputPath(job, in);
		FileOutputFormat.setOutputPath(job, out);
		System.exit(job.waitForCompletion(true) ? 0 : 1);

	}

	public static boolean isNumeric(String str) {
		for (int i = 0; i < str.length(); i++) {
			if (Character.isDigit(str.charAt(i)) || str.charAt(i) == '.') {
				return true;
			}
		}
		return false;
	}

}